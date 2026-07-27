FROM debian:12

RUN apt-get update \
    && apt-get install -y --no-install-recommends nginx openssl gettext-base \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
# openssl is required for protocols like TLS/SSL for a secure connection (encryption and decryption)

COPY conf/nginx.conf /etc/nginx/nginx.conf

COPY ./tools/docker-entrypoint.sh /

RUN chmod +x /docker-entrypoint.sh

EXPOSE 443

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]