FROM debian:11
RUN apt-get update && apt-get install mariadb-server -y
COPY ./50-mariadb.conf /etc/mysql/mariadb.conf.d/
RUN mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld
COPY ./tools/init-db.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/init-db.sh
EXPOSE 3306
ENTRYPOINT ["init-db.sh"]
CMD ["mysqld"]