#!/bin/bash

if [ "$1" = "" ]
then
  echo "ERROR: Missing argument $0 domain.com"
  exit
fi

#delete dir file
sudo rm -rf ../$1/

#delete vhost
sudo rm apache2/sites/$1.conf 

echo "$1 : Successfully deleted!!!"



