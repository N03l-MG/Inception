FROM debian:11
RUN apt update && apt install php php-fpm php-mysql curl wget unzip mariadb-client -y
RUN rm -rf /var/lib/apt/lists/*

#COPY ./wp-config.php /
COPY ./tools/install-wp.sh /install-wp.sh
RUN chmod +x /install-wp.sh
VOLUME /var/www/html

EXPOSE 9000

ENTRYPOINT [ "/install-wp.sh" ]