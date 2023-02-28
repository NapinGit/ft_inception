FROM alpine:3.14
RUN	apk update
RUN apk add nginx
RUN	apk add openssl
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/aloiseau.pem \
        -keyout /etc/nginx/ssl/aloiseau.key \
        -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=aloisea/CN=aloiseau/"

RUN mkdir -p /run/nginx
RUN apk add		nano
COPY nginx.conf /etc/nginx/http.d/default.conf
EXPOSE 80 443
RUN apk add openrc
RUN mkdir -p /run/openrc
RUN touch /run/openrc/softlevel
ENTRYPOINT ["nginx", "-g", "daemon off;"]
