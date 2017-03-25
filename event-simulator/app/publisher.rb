require "ruby-kafka"
require "json"

# kafka = Kafka.new(
#   # At least one of these nodes must be available:
#   seed_brokers: ["localhost:9091"],
#   # Set an optional client id in order to identify the client to Kafka:
#   client_id: "my-application",
# )
#
# kafka.deliver_message("Hello, World!", topic: "gojek-test")
# kafka.deliver_message(x.to_json, topic: "gojek-test")

class Publisher

  def initialize
    # @kafka = Kafka.new(seed_brokers: ["localhost:9091"],client_id: "event-generator")
    @kafka = Kafka.new(
      # At least one of these nodes must be available:
      seed_brokers: ["127.0.0.1:9091", "127.0.0.1:9092", "127.0.0.1:9093"],
      # Set an optional client id in order to identify the client to Kafka:
      client_id: "event-simulator"
    )
  end

  def publish(topic, message)
    @kafka.deliver_message(message.to_json, topic: topic)
  rescue => e
    # logger.error(e.to_s)
    puts "[Error] #{e.to_s}. topic: #{topic}, message: #{message}"
  end

end
