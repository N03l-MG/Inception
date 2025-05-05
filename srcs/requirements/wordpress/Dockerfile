FROM debian:11
RUN apt update && apt install php-fpm php-mysql curl -y
EXPOSE 9000
COPY ./wp-config.php /
COPY ./tools/install-wp.sh /
RUN chmod +x /install-wp.sh
RUN mkdir /var/www/ /var/www/html && cd /var/www/html && rm -rf *
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
RUN cd /var/www/html && wp core download --allow-root
WORKDIR /var/www/html
RUN cp wp-config-sample.php wp-config.php
RUN mv /wp-config.php /var/www/html/wp-config.php
CMD [ "/install-wp.sh" ]