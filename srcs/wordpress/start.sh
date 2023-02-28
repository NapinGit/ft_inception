#!/bin/sh
while ! mysql -u$WP_DATABASE_USR -p$WP_DATABASE_PWD -e '\q'; do
    sleep 1
done
if [ ! -f "/var/www/html/wordpress/wp-config.php" ]; then
	cp wp-cli.phar /var/www/html/
	#cd /var/www/html
    wp core download --allow-root
    wp config create --dbname=$WP_DATABASE_NAME --dbuser=$WP_DATABASE_USR --dbpass=$WP_DATABASE_PWD --dbhost=$MYSQL_HOST --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
    wp core install --url=$DOMAIN_NAME/wordpress --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
    wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root
    #wp theme install inspiro --activate --allow-root
fi
#if [ ! -f "/etc/php7/php-fpm.conf" ]; then
#  mv /tmp/php-fpm.conf /etc/php7/
#  mv /tmp/www.conf /etc/php7/php-fpm.d/
#fi
/usr/sbin/php-fpm7 -F -R