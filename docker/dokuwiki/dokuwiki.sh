#!/bin/sh

docker volume create dokuwiki_data

docker run -d \
	--name dokuwiki \
	-p 80:8080 \
	-p 443:8443 \
	--volume dokuwiki_data:/bitnami/dokuwiki \
	--restart always \
	bitnami/dokuwiki:latest