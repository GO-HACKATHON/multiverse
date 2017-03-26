Multiverse::Graviton
====

Real time geospatial data analytic & visualization platform

## Background
Booming of geolocation data with high velocity. 
Example: 
     
- Gojek data: driver real time location, order location, merchant location, etc.
- iOT data: humidity sensor, air pollution sensor, river level sensor, etc

## Problem

**Business perspective:**
The need to visualise & analyse real time geospatial data.

**Technical perspective:**
The need of platform, library, data modelling/architecture that can easily visualise & analyse realtime geospatial data.

## Challenges
Realtime Geospatial data characteristics:
- high volume
- high variety
- high velocity

Some people call it: BIG DATA

## Multiverse solution
In this project we provide
- Data modelling (convention & configuration)
- Data architecture
- Data visualisation

that can be reusable for any kind of time series geospatial/geolocation data.

Our goal is to create architecture & data modelling that:
 - Horizontally scalable
- Fault tolerant
- Near realtime insight
- Optimised for realtime geolocation data.


## Guideline

(TBA)



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
