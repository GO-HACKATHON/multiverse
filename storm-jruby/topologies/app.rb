java_import 'storm.kafka.SpoutConfig'
java_import 'storm.kafka.KafkaSpout'
java_import 'storm.kafka.KafkaConfig'
java_import 'storm.kafka.ZkHosts'

require 'red_storm'
require 'json'
require 'aerospike'

include Aerospike

### Aerospike not supported for jruby :(
$CLIENT = Client.new("127.0.0.1", "3000")

# the KafkaTopology obviously requires a Kafka server running, you can ajust the
# host and port below.
#
# custom dependencies are required for the Kafka and Scala jars. put the following
# dependencies in the "ivy/topology_dependencies.xml" file in the root of your RedStorm project
# (in addition to the default dependencies, and any additions you may have added):

# <dependency org="org.scala-lang" name="scala-library" rev="2.9.2" conf="default" transitive="false"/>
# <dependency org="org.apache.kafka" name="kafka_2.9.2" rev="0.8.1.1" conf="default" transitive="false" />
# <dependency org="net.wurstmeister.storm" name="storm-kafka-0.8-plus" rev="0.4.0" conf="default" transitive="false" />
# <dependency org="com.yammer.metrics" name="metrics-core" rev="2.2.0"/>

class SplitStringBolt < RedStorm::DSL::Bolt
  on_receive do |tuple| 
   String.from_java_bytes(tuple.value(:bytes)).split.map{|w| [w]}
   log.info("================ event =====================")
   # key = Key.new('test', 'test', 'key value')
   # bin_map = {
   #  'bin1' => 'value1',
   #  'bin2' => 2,
   #  'bin4' => ['value4', {'map1' => 'map val'}],
   #  'bin5' => {'value5' => [124, "string value"]}}
   # $CLIENT.put(key, bin_map)
  end

end

class KafkaTopology < RedStorm::DSL::Topology

  spout_config = SpoutConfig.new(
    ZkHosts.new("localhost:2181", "/brokers"),
    "driver",        # topic to read from
    "/kafkaspout",  # Zookeeper root path to store the consumer offsets
    "someid"        # Zookeeper consumer id to store the consumer offsets
  )

  spout KafkaSpout, [spout_config]

  bolt SplitStringBolt do
    output_fields :word
    source KafkaSpout, :shuffle
    debug true
  end

  configure do |env|
    debug false
    max_task_parallelism 4
    num_workers 1
    max_spout_pending 1000
  end

  on_submit do |env|
    if env == :local
      #sleep(120)
      #cluster.shutdown
    end
  end
end
