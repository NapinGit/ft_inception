
FROM alpine:3.13

RUN	apk update && apk upgrade && apk add --no-cache \
        mariadb \
        mariadb-client
        
COPY start.sh /tmp/start.sh

RUN chmod +x /tmp/start.sh

ENTRYPOINT ["sh", "/tmp/start.sh"]