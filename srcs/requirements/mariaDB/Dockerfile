FROM debian:12

RUN apt-get update \
    && apt-get install -y --no-install-recommends mariadb-server \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld

COPY ./conf/my.cnf /etc/mysql/my.cnf

COPY ./tools/docker-entrypoint.sh /

RUN chmod +x /docker-entrypoint.sh

EXPOSE 3306

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["mysqld", "--user=mysql", "--console"]
