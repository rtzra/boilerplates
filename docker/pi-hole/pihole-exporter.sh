#!/bin/sh

docker run \
  -d \
  -p 9617:9617 \
  -e 'PIHOLE_HOSTNAME=10.10.10.1' \
  -e "PIHOLE_API_TOKEN=YOU-API-TOKEN-FOR-PIHOLE" \
  -e 'INTERVAL=30s' \
  -e 'PORT=9617' \
  ekofr/pihole-exporter:latest
