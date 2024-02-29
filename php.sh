#!/bin/bash

echo -e "Install Laravel Installer\n"
composer global require laravel/installer

echo -e "Install PHP CS Fixer\n"
composer global require friendsofphp/php-cs-fixer

sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php/8.3/fpm/php.ini
sed -i "s/display_errors = .*/display_errors = On/" /etc/php/8.3/fpm/php.ini
sed -i "s/memory_limit = .*/memory_limit = 512M/" /etc/php/8.3/fpm/php.ini
sed -i "s/upload_max_filesize = .*/upload_max_filesize = 100M/" /etc/php/8.3/fpm/php.ini
sed -i "s/post_max_size = .*/post_max_size = 100M/" /etc/php/8.3/fpm/php.ini
sed -i "s/max_file_uploads = .*/max_file_uploads = 20/" /etc/php/8.3/fpm/php.ini
sed -i "s/max_execution_time = .*/max_execution_time = 600/" /etc/php/8.3/fpm/php.ini
sed -i "s/;date.timezone.*/date.timezone = America\/Recife/" /etc/php/8.3/fpm/php.ini
