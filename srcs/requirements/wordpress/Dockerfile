FROM debian:11
RUN apt update && apt install php php-fpm php-mysql curl mariadb-client -y

COPY ./tools/install-wp.sh /install-wp.sh
RUN chmod +x /install-wp.sh
VOLUME /var/www/html

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN sed -i -e 's/listen =.*/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

WORKDIR /var/www/html
RUN wp core download --allow-root
RUN mkdir /run/php

ENTRYPOINT [ "/install-wp.sh" ]

CMD [ "php-fpm7.4", "-F" ]
