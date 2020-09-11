#!/bin/bash

if [ -f fonction ]; then
  . ./fonction
fi


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
                installation_nginx_php7
        ;;

        2 ) ### creation d'Nginx php7
                installation_nginx_proxy
        ;;

        3 ) ### creation d'Nginx php7
                installation_nginx_mail
        ;;

        20 ) ### creation d'Nginx php7
                installation_postgres
        ;;

        21 ) ### creation d'Nginx php7
                installation_mariadb
        ;;



esac
done
