#!/bin/sh

docker run -d --name urbackup-server \
  --restart-always
  -v /mnt/backups:/backups \
  -v /mnt/database:/var/urbackup \
  -p 55413-55415:55413-55415 \
  -p 35623:35623/udp \
  uroni/urbackup-server

