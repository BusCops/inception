FROM debian:12

RUN apt-get update && apt-get install -y --no-install-recommends \
    php8.2-fpm \
    php8.2-mysql \
    php8.2-curl \
    curl \
    && rm -rf /var/lib/apt/lists/*

COPY ./tools/docker-entrypoint.sh

RUN chmod +x /docker-entrypoint.sh

RUN curl -O 

EXPOSE 9000

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD [""]