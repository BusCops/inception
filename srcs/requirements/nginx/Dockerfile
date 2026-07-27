FROM debian:12

RUN apt update && apt install -y nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

COPY ./tools/docker-entrypoint.sh /

RUN chmod +x /docker-entrypoint.sh

EXPOSE 443

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]