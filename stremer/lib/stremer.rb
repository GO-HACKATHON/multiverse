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

  class EventConsumer
    def initialize
      @consumer = Consumer.new
      # event topic(previously: "driver", "order")
      @consumer.subscribe("event")
    end

    def init_daily_bins_for_key key, client
      bin_map = {
        '01' => [], '02'=> [], '03' => [], '04'=> [], '05' => [], '06'=> [],
        '07'=> [], '08' => [], '09'=> [], '10' => [], '11'=> [], '12' => [], '13'=> [],
        '14'=> [], '15' => [], '16'=> [], '17' => [], '18'=> [], '19' => [], '20'=> [],
        '21'=> [], '22' => [], '23'=> [], '24' => [], '25' => [], '26' => [], '27' => [],
        '28' => [], '29' => [], '30' => [], '31' => []
      }
      client.put(key, bin_map)
    end

    def init_hourly_bins_for_key key, client
      bin_map = {
        '00'=> [], '01' => [], '02'=> [], '03' => [], '04'=> [], '05' => [], '06'=> [],
        '07'=> [], '08' => [], '09'=> [], '10' => [], '11'=> [], '12' => [], '13'=> [],
        '14'=> [], '15' => [], '16'=> [], '17' => [], '18'=> [], '19' => [], '20'=> [],
        '21'=> [], '22' => [], '23'=> []
      }
      client.put(key, bin_map)
    end

    def init_minutely_bins_for_key key, client
      bin_map = {
        '00'=> [], '01' => [], '02'=> [], '03' => [], '04'=> [], '05' => [], '06'=> [],'07'=> [], '08' => [], '09'=> [], '10' => [],
        '11' => [], '12'=> [], '13' => [], '14'=> [], '15' => [], '16'=> [],'17'=> [], '18' => [], '19'=> [], '20' => [],
        '21' => [], '22'=> [], '23' => [], '24'=> [], '25' => [], '26'=> [],'27'=> [], '28' => [], '29'=> [], '30' => [],
        '31' => [], '32'=> [], '33' => [], '34'=> [], '35' => [], '36'=> [], '37'=> [], '38' => [], '39'=> [], '40' => [],
        '41' => [], '42'=> [], '43' => [], '44'=> [], '45' => [], '46'=> [], '47'=> [], '48' => [], '49'=> [], '50' => [],
        '51' => [], '52'=> [], '53' => [], '54'=> [], '55' => [], '56'=> [], '57'=> [], '58' => [], '59'=> [], '60' => []
      }
      client.put(key, bin_map)
    end

    def listen!
      client = Stremer.aerospike
      @consumer.on_messages do |message|
        begin
          parsed_message = JSON.parse(message.value)
          point = Aerospike::GeoJSON.new({type: "Point", coordinates: parsed_message["body"]["location"]})

          # event_name = "driver.idle.on.location"
          event_name = parsed_message["header"]["event_name"]
          timestamp = parsed_message["header"]["timestamp"].to_i

          day_key = daily_key_for_timestamp(timestamp, event_name)
          hour_key = hourly_key_for_timestamp(timestamp, event_name)
          minute_key = minutely_key_for_timestamp(timestamp, event_name)

          add_point_to_daily_stats(timestamp, client, day_key, point)
          add_point_to_hourly_stats(timestamp, client, hour_key, point)
          add_point_to_minutely_stats(timestamp, client, minute_key, point)
          print(".")

        rescue => e
          puts e.inspect
        end
      end
    end

    def add_point_to_daily_stats(timestamp, client, key, point)
      init_daily_bins_for_key(key, client) unless client.exists(key)
      record = client.get(key)
      bins_key = Time.at(timestamp).to_datetime.strftime("%d")
      bin_temp = record.bins[bins_key]
      bin_temp << point
      record.bins[bins_key] = bin_temp
      client.put(key, record.bins)
    end

    def add_point_to_hourly_stats(timestamp, client, key, point)
      init_hourly_bins_for_key(key, client) unless client.exists(key)
      record = client.get(key)
      bins_key = Time.at(timestamp).to_datetime.strftime("%H")
      bin_temp = record.bins[bins_key]
      bin_temp << point
      record.bins[bins_key] = bin_temp
      client.put(key, record.bins)
    end

    def add_point_to_minutely_stats(timestamp, client, key, point)
      init_minutely_bins_for_key(key, client) unless client.exists(key)
      record = client.get(key)
      bins_key = Time.at(timestamp).to_time.strftime("%M")
      bin_temp = record.bins[bins_key]
      bin_temp << point
      record.bins[bins_key] = bin_temp
      client.put(key, record.bins)
    end

    def daily_key_for_timestamp(timestamp, event)
      pk = Time.at(timestamp).to_datetime.strftime("daily#{event}:%Y%m")
      Aerospike::Key.new("test", "event", pk)
    end

    def hourly_key_for_timestamp(timestamp, event)
      pk = Time.at(timestamp).to_datetime.strftime("hourly#{event}:%Y%m%d")
      Aerospike::Key.new("test", "event", pk)
    end

    def minutely_key_for_timestamp(timestamp, event)
      pk = Time.at(timestamp).to_datetime.strftime("minutely#{event}:%Y%m%d%H")
      Aerospike::Key.new("test", "event", pk)
    end
  end
end
