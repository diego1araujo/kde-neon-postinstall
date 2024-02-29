#!/bin/bash

# https://www.phpmyadmin.net/files/

echo -e "Download the zip file\n"
wget -O phpmyadmin.zip https://files.phpmyadmin.net/phpMyAdmin/5.2.1/phpMyAdmin-5.2.1-all-languages.zip

echo -e "Unzip the archive\n"
unzip phpmyadmin.zip

echo -e "Remove the zip file\n"
sudo rm -rf phpmyadmin.zip

echo -e "Move the phpMyAdmin folder to your document root\n"
sudo mv phpMyAdmin-5.2.1-all-languages /var/www/html/phpmyadmin

echo -e "Update ownership\n"
sudo chown -R www-data:www-data /var/www/html/phpmyadmin

echo -e "Create temp dir\n"
sudo mkdir -p /var/www/html/phpmyadmin/tmp
sudo mkdir -p /var/www/html/phpmyadmin/tmp/twig

cd /var/www/html/phpmyadmin

echo -e "Rename the sample config file\n"
sudo mv config.sample.inc.php config.inc.php

echo -e "Add at the end of config.inc.php\n"
sudo nano config.inc.php
# $cfg['TempDir'] = '/tmp';
# $cfg['blowfish_secret'] = '';
# $cfg['Servers'][$i]['AllowNoPassword'] = true;
# $cfg['DefaultCharset'] = 'utf8mb4';
# $cfg['DefaultConnectionCollation'] = 'utf8mb4_general_ci';

echo -e "Fix error: Wrong permissions on configuration file, should not be world writable!\n"
sudo chmod 755 config.inc.php

# Generate blowfish secret
# https://phpsolved.com/phpmyadmin-blowfish-secret-generator/

valet link
