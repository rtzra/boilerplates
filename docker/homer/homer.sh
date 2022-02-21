#!/bin/sh

docker run -d \
  --name=homer \
  -p 8080:8080 \
  -v /home/homer/assets:/www/assets \
  --restart=always \
  b4bz/homer:latest

