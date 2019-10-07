#!/bin/bash

if [ "$1" = "" ]
then
  echo "ERROR: Missing argument $0 domain.com"
  exit
fi

#Create dir file
sudo mkdir ../$1/


#Create VHOST
echo "<VirtualHost *:80>
  ServerName $1
  DocumentRoot /var/www/$1/public_html/
  Options Indexes FollowSymLinks

  <Directory "/var/www/$1/public_html/">
    AllowOverride All
    <IfVersion < 2.4>
      Allow from all
    </IfVersion>
    <IfVersion >= 2.4>
      Require all granted
    </IfVersion>
  </Directory>

</VirtualHost>" > $1.conf

sudo mv ./$1.conf apache2/sites/$1.conf 
echo "$1 : Successfully Created!!!"



