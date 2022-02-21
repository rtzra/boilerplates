#!/bin/sh

docker run --detach --restart=always --log-opt max-size=10m \
 --cpus=1 --memory=64m --memory-reservation=64m \
 --cap-add=SYS_ADMIN --cap-add=NET_RAW --cap-add=CHOWN \
 --mount type=tmpfs,destination=/var/atlasdata,tmpfs-size=64M \
 --label=com.centurylinklabs.watchtower.enable=true \
 -v /var/atlas-probe/etc:/var/atlas-probe/etc \
 -v /var/atlas-probe/status:/var/atlas-probe/status \
 -e RXTXRPT=yes \
 --name ripe-atlas --hostname "$(hostname --fqdn)" \
 jamesits/ripe-atlas:latest
