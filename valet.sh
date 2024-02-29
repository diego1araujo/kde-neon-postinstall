#!/bin/bash

echo -e "Add php repository"
sudo add-apt-repository ppa:ondrej/php -y

echo -e "Update the system"
sudo apt -y update

echo -e "Install dependencies packages"
sudo apt-get install network-manager libnss3-tools jq xsel ca-certificates apt-transport-https software-properties-common

echo -e "Install PHP 8.3"
sudo apt -y install php8.3-fpm php8.3-cli php8.3-{common,bcmath,mbstring,xml,mysql,zip,curl,opcache,pdo,ctype,tokenizer,fileinfo,sqlite3,redis,intl,gd}

echo -e "Install Laravel Valet"
composer global require cpriego/valet-linux
valet install
# ping foobar.test

########################################

# echo -e "Make main project folder available for valet - Go to the folder and type"
# valet park

# echo -e "Make a folder unavailable for valet - Go to the folder and type"
# valet forget

# echo -e "Make each project folder available for valet - Go to the folder and type"
# valet link

# sudo service php8.3-fpm|nginx|mysql start|stop|reload|status
# sudo systemctl start|stop|restart|enable|disable|is-active|is-enabled php8.3-fpm|nginx|mysql

# /etc/nginx/nginx.conf
# worker_processes auto to -> worker_processes 4;

# sudo service mysql status
# sudo systemctl stop php8.3-fpm
# sudo systemctl disable php8.3-fpm
# sudo systemctl stop nginx
# sudo systemctl disable nginx
# sudo systemctl stop mysql
# sudo systemctl disable mysql
