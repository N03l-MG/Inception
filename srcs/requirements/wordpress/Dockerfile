FROM debian:11
RUN apt update && apt install php-fpm php-mysql -y
RUN apt install curl -y
COPY ./tools/wordpress_conf.php /
CMD [ "/run_wordpress.sh" ]