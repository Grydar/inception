FROM debian:bullseye

RUN apt update && apt upgrade -y
RUN apt install wget -y
RUN apt install php7.4-fpm -y
RUN apt install php-mysql -y

#RUN wget https://wordpress.org/latest.tar.gz -P /var/www/html
#RUN cd /var/www/html && tar -xvf latest.tar.gz -C /var/www/html && rm -rf latest.tar.gz
#RUN mv /var/www/html/wordpress/* /var/www/html && rm -rf /var/www/html/wordpress
#RUN chown -R www-data:www-data /var/www/html

#RUN chown -R www-data:www-data /var/www/html
#RUN chmod -R 755 /var/www/html

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY ./tools/wordpress.sh /usr/local/bin/wordpress.sh

RUN mkdir -p /run/php

RUN chmod +x /usr/local/bin/wordpress.sh

ENTRYPOINT ["/usr/local/bin/wordpress.sh"]

EXPOSE 9000

CMD ["php-fpm7.4", "-F"]