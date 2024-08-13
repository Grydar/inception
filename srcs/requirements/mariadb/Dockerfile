FROM debian:bullseye

RUN apt update && apt upgrade -y
RUN apt install mariadb-server -y

COPY ./conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/mariadb.sh		/usr/local/bin/mariadb.sh

RUN chmod +x /usr/local/bin/mariadb.sh

RUN mkdir -p /var/lib/mysql \
&& chown -R mysql:mysql /var/lib/mysql \
&& chmod 755 /var/lib/mysql

ENTRYPOINT ["/usr/local/bin/mariadb.sh"]

EXPOSE 3306