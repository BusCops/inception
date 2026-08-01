FROM debian:12

RUN apt-get update \
    && apt-get install -y --no-install-recommends nginx openssl gettext-base \
    && rm -rf /var/lib/apt/lists/*
# openssl is used to generate the self-signed SSL/TLS certificate required by nginx to serve HTTPS traffic.

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

COPY ./tools/docker-entrypoint.sh /

##########tmp
COPY ./index.html /var/www/html/index.html
##########tmp

RUN chmod +x /docker-entrypoint.sh

EXPOSE 443

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]
