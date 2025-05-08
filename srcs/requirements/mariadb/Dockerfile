FROM debian:11
RUN apt-get update && apt-get install mariadb-server -y
COPY ./conf/ /etc/mysql/conf.d/
COPY ./tools/init-db.sh /init-db.sh
RUN chmod +x /init-db.sh
RUN mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld
EXPOSE 3306
VOLUME /var/lib/mysql
ENTRYPOINT [ "/init-db.sh" ]