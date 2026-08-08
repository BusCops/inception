FROM debian:12

RUN apt-get update && apt-get install -y \
    php8.2-fpm \
    php8.2-mysql \
    php8.2-curl \
    curl \
    && rm -rf /var/lib/apt/lists/*

COPY ./tools/docker-entrypoint.sh /

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

RUN chmod +x /docker-entrypoint.sh

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["php-fpm8.2", "-F"]