FROM debian:11
# RUN apt-get update && apt-get install mariadb-server -y
# COPY ./conf/ /etc/mysql/conf.d/
# COPY ./tools/init-db.sh /init-db.sh
# RUN chmod +x /init-db.sh
# RUN mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld
# EXPOSE 3306
# VOLUME /var/lib/mysql
# ENTRYPOINT [ "/init-db.sh" ]

RUN apt-get update && \
    apt-get install -y mariadb-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY tools/init-db.sh /usr/local/bin/init-db.sh
RUN chmod +x /usr/local/bin/init-db.sh

RUN sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf

ENTRYPOINT [ "init-db.sh" ]

CMD [ "mysqld_safe" ]
