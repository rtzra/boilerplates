#!/bin/sh

docker run -d \
  --name=heimdall \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/Moscow \
  -p 8081:80 \
  -p 8443:443 \
  -v /home/heimdall/config:/config \
  --restart unless-stopped \
  ghcr.io/linuxserver/heimdall

