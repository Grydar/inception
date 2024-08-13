FROM debian:bullseye

RUN apt update && apt upgrade -y
RUN apt install wget -y
RUN apt install php7.4-fpm -y
RUN apt install php-mysql -y

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY ./tools/wordpress.sh /usr/local/bin/wordpress.sh

RUN mkdir -p /run/php

RUN chmod +x /usr/local/bin/wordpress.sh

ENTRYPOINT ["/usr/local/bin/wordpress.sh"]

EXPOSE 9000

CMD ["php-fpm7.4", "-F"]