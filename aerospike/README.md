Graviton::Aerospike
====

NoSQL database for real-time operational applications to save analytical data.

## Usage

Docker command to run aerospike server
```
docker run -tid --name aerospike -p 3000:3000 -p 3001:3001 -p 3002:3002 -p 3003:3003 aerospike/aerospike-server
```

Docker command to run Aerospike Query Language (AQL)
```
docker run -it aerospike/aerospike-tools aql -h  $(docker inspect -f '{{.NetworkSettings.IPAddress }}' aerospike)
```

## By
Multiverse team
