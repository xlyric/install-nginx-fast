#!/bin/bash

# colors 
GREEN='\033[0;32m'
RED='\033[1;31m'
YELLOW='\033[0;33m'
BLUE='\033[1;34m'
NC='\033[0m' # No Color

# update system package
apt-get update

HOME=$(pwd)
CONFFILES="$HOME/config"

############### menu
until [ "$menu" -eq "100" ]
do
echo -e " ${BLUE} Menu :${NC}

${GREEN}####### Nginx install ######${NC}
1 : nginx php7
2 : nginx proxy
3 : nginx proxy mail
${GREEN}####### BDD install ######${NC}
20 : Postgres
21 : mariadb + phpmyadmin

100 : quit
"

echo -e " ${YELLOW} entrer  your choice : ${NC}"
read menu

############### case of
case $menu in
        1 ) ### creation d'Nginx php7
                installation_nginx_php7()
        ;;

        2 ) ### creation d'Nginx php7
                ./installation_nginx_proxy.sh
        ;;

        3 ) ### creation d'Nginx php7
                ./installation_nginx_mail.sh
        ;;

        20 ) ### creation d'Nginx php7
                ./installation_postgres.sh
        ;;

        21 ) ### creation d'Nginx php7
                ./installation_mariadb.sh
        ;;



esac
done


#####functions

#function check php version
check_php() {
	php -version | grep PHP |grep --only-matching --perl-regexp "\d+\.\\d+\.\\d+" | cut -d"." -f1
}

# function install Nginx - PHP7
installation_nginx_php7() {

	###
	apt-get install -y nginx  php-fpm  php-memcached memcached php

	#conf  php avec Nginx
	cp $CONFFILES/test.php /var/www/html/
	cp $CONFFILES/nginx_default_php7 /etc/nginx/sites-enabled/default
	service nginx restart

	# conf memcache
	cp $CONFFILES/memcached.conf /etc/memcached.conf
	service memcached restart
}
