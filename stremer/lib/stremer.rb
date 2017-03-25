require "stremer/version"
require "yaml"
require "erb"
require "active_support/all"
require "aerospike"
require "kafka"

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
end
