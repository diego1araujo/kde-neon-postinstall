#!/bin/bash

echo -e "Install MySQL Server"
sudo apt -y install mysql-server

echo -e "To fix access denied for user 'root'@'localhost'"
sudo mysql
USE mysql;
UPDATE user SET plugin='mysql_native_password' WHERE user='root';
FLUSH PRIVILEGES;
exit;
