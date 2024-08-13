#!/bin/bash

sleep 10

cd /var/www/html

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root \
	--force

wp config create --allow-root \
	--dbname=${MYSQL_DATABASE} \
	--dbuser=${MYSQL_USER} \
	--dbpass=${MYSQL_PASSWORD} \
	--dbhost=mariadb:3306 --path='/var/www/html'

wp core install --allow-root \
	--url=https://${DOMAIN_NAME} \
	--title="Inception site" \
	--admin_user=${WP_ADMIN} \
	--admin_password=${WP_ADMIN_PASSWORD} \
	--admin_email=fakeadmin@example.com

wp user create --allow-root \
	${WP_USER} fakeuser@example.com \
	--role=editor \
	--user_pass=${WP_USER_PASSWORD}

echo "launching php-fpm"

exec "$@"

echo "done"