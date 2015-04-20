#!/bin/bash
set -e

service mysql start

sleep 15

mysql -u root -e "CREATE DATABASE aas_test" 
mysql -u root -e "USE 'aas_test';"
mysql -u root -e "CREATE USER 'aas_test'@'localhost' IDENTIFIED BY 'aas_test'" 
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'aas_test'@'localhost' WITH GRANT OPTION;" 

exec "$@"


