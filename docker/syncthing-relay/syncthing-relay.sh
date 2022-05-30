#!/bin/sh

docker volume create syncthing-relay

docker run -d \
    --name syncthing-relay \
    -p 22067:22067 \
    --volume syncthing-relay:/home/syncthing/certs \
    --restart=always \
    t4skforce/syncthing-relay-discovery:latest
