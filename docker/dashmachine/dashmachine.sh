#!/bin/sh

docker run -d \
  --name=dashmachine \
  -p 5000:5000 \
  -v /home/dashmachine/dashmachine-data:/dashmachine/dashmachine/user_data \
  --restart unless-stopped \
  rmountjoy/dashmachine:latest

