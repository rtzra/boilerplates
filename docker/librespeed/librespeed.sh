#!/bin/sh

docker run -d \
--restart=unless-stopped \
-e MODE=standalone \
-e TELEMETRY=true \
-e ENABLE_ID_OBFUSCATION=true \
-e PASSWORD="YOU-OWN-ADMIN-PASSWORD" \
-e WEBPORT=86 \
-p 86:86 \
 adolfintel/speedtest
