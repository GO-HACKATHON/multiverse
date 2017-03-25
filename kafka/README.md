Graviton::Kafka
===

Apache Kafka cluster configuration

## Run zookeeper

```
bin/zookeeper-server-start.sh config/zookeeper.properties
```

## Run kafka broker

```
bin/kafka-server-start.sh config/server-1.properties
bin/kafka-server-start.sh config/server-2.properties
bin/kafka-server-start.sh config/server-3.properties
```

## Important config

### on server-1.properties, server-2.properties, server-3.properties

```
# The id of the broker. This must be set to a unique integer for each broker.
broker.id=1

# port
listeners=PLAINTEXT://:9091

# log directory
log.dirs=/tmp/kafka-logs-1

# The minimum age of a log file to be eligible for deletion due to age
log.retention.hours=168

# zookeeper endpoint
zookeeper.connect=localhost:2181
```

## Create kafka topic
```
bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic order
bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic driver
```

## Console consumer
```
bin/kafka-console-consumer.sh --bootstrap-server localhost:9093 --from-beginning --topic order
bin/kafka-console-consumer.sh --bootstrap-server localhost:9093 --from-beginning --topic driver
```


## By
Multiverse team
