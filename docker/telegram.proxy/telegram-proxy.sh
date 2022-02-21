#!/bin/sh
# https://hub.docker.com/r/telegrammessenger/proxy

docker run -d \
  -p 443:443 \
  --name=mtproto-proxy \
  --restart=always \
  -v proxy-config:/data \
  telegrammessenger/proxy:latest