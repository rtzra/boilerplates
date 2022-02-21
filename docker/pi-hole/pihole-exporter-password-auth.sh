#!/bin/sh

docker run \
  -e 'PIHOLE_PROTOCOL=http' \
  -e 'PIHOLE_HOSTNAME=10.10.10.1' \
  -e 'PIHOLE_PASSWORD=YOU-PIHOLE-LOGIN-PASSWORD' \
  -e 'INTERVAL=30s' \
  -e 'PORT=9617' \
  -p 9617:9617 \
  ekofr/pihole-exporter:latest
