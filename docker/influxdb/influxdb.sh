#!/bin/sh

docker run -d \
     -p 8086:8086 \
     --mount type=volume,source=influx-data,target=/var/lib/influxdb2 \
     --mount type=volume,source=influx-conf,target=/etc/influxdb2 \
     --name influxdb \
     -e DOCKER_INFLUXDB_INIT_MODE=setup \
     -e DOCKER_INFLUXDB_INIT_USERNAME=YOU-USERNAME \
     -e DOCKER_INFLUXDB_INIT_PASSWORD=YOU-PASSWORD \
     -e DOCKER_INFLUXDB_INIT_ORG=YOU-DOMAIN.COM \
     -e DOCKER_INFLUXDB_INIT_BUCKET=YOU-BUCKET \
     --restart=always \
     influxdb:latest

