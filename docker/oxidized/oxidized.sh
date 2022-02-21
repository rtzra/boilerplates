#!/bin/sh

docker run -d --rm \
	-v /etc/oxidized:/root/.config/oxidized \
	-p 8888:8888/tcp \
	-t oxidized/oxidized:latest oxidized

