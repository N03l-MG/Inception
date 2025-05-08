FROM debian:11

RUN apt update && apt install -y mariadb-server expect

COPY tools/init-db.sh /usr/local/bin/init-db.sh
COPY tools/secure-db.exp /tmp/secure-db.exp

RUN chmod +x /usr/local/bin/init-db.sh

RUN sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf

ENTRYPOINT [ "init-db.sh" ]

CMD [ "mysqld_safe" ]
