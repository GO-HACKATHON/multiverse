Multiverse::Graviton
====


## Architecture

![13611ff](https://cloud.githubusercontent.com/assets/176688/24320758/3dbc6ea2-116e-11e7-931f-ac1cfe829d1a.png)


1. Apache Kafka

    High-throughput, low-latency platform for handling real-time high load of Gojek event data.

2. Apache Storm

    Distributed realtime computation system to compute/aggregate data stream from Kafka into analytical data model.

3. Aerospike

    NoSQL database for real-time operational applications to save analytical data.

4. Rails

    To build API of analytical data (query abstraction) from Aerospike

5. d3.js

    To build rich interactive front end visualization of analytical data.




## Team:
Multiverse

- Andri Setiawan
- Azhar Amir
- Fauzan Qadri
