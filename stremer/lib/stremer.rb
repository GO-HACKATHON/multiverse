require "stremer/version"
require "yaml"
require "erb"
require "active_support/all"
require "aerospike"
require "kafka"
require "pry"

module Stremer
  def self.root
    File.expand_path('./')
  end
  
  def self.config
    ActiveSupport::HashWithIndifferentAccess.new(
      YAML.load(ERB.new(IO.read("#{root}/config/streamer.yml")).result)
    )
  end
  
  def self.aerospike
    return Aerospike::Client.new(config[:aerospike][:host])
  end  

  class Consumer
    
    def initialize
      kafka = Kafka.new(seed_brokers: ["10.17.10.155:9091"])
      @consumer ||= kafka.consumer(group_id: Stremer.config[:kafka][:group_id])
    end
    
    def subscribe topic
      @consumer.subscribe(topic)
    end
    
    
    def on_messages &block
      @consumer.each_message &block
    end
    
  end

  class CancelationConsumer
    
    def initialize
      @consumer = Consumer.new
      @consumer.subscribe("order")
    end
    
    def init_bins_for_key key, client
      bin_map = {
        '00'=> [], '01' => [], '02'=> [], '03' => [], '04'=> [], '05' => [], '06'=> [],
        '07'=> [], '08' => [], '09'=> [], '10' => [], '11'=> [], '12' => [], '13'=> [],
        '14'=> [], '15' => [], '16'=> [], '17' => [], '18'=> [], '19' => [], '20'=> [],
        '21'=> [], '22' => [], '23'=> []
      }
      client.put(key, bin_map)
    end
    
    def listen!
      client = Stremer.aerospike
      @consumer.on_messages do |message|
        begin
          parsed_message = JSON.parse(message.value)
          
          if parsed_message["header"]["event_name"] == "order.canceled"
            timestamp = parsed_message["header"]["timestamp"].to_i
            hourlycancelation_key = Time.at(timestamp).to_datetime.strftime("hourlycancelation:%Y%m%d")
            key = Aerospike::Key.new("test", "order_cancelation", hourlycancelation_key)
            
            init_bins_for_key(key, client) unless client.exists(key)

            record = client.get(key)
            point = Aerospike::GeoJSON.new({type: "Point", coordinates: parsed_message["body"]["location"]})
            bins_key = Time.at(timestamp).to_datetime.strftime("%H")
            bin_temp = record.bins[bins_key]
            bin_temp << point
            record.bins[bins_key] = bin_temp
            client.put(key, record.bins)
            print(".")
          end
        rescue => e
          puts e.inspect
        end
        # puts JSON.parse(message.value)["header"]
      end
    end
    
  end
end
