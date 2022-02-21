#!/bin/sh

# see https://github.com/0xERR0R/blocky
#     https://0xerr0r.github.io/blocky/

ip_addr=10.10.1.20

docker ps -a --no-trunc  | grep "blocky" | awk '{print $1}' | xargs docker container stop

docker pull spx01/blocky

echo y | docker system prune --volumes

sudo cp blocky.yml /opt/blocky.yml

sudo docker volume create blocky_logs
sudo docker volume create block_blacklist

docker run -d \
    --name blocky \
    --restart unless-stopped \
    -v blocky_blacklist:/app/blacklists/ \
    -v blocky_logs:/logs \
    -v /opt/blocky.yml:/app/config.yml \
    -p $ip_addr:4000:4000 \
    -p $ip_addr:53:53/udp \
    spx01/blocky