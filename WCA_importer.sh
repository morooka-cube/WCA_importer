#!/bin/sh

# Making work space if it doesn't exist
mkdir -p /usr/WCA_importer
cd /usr/WCA_importer

# Getting file name of latest WCA export
name=`curl https://www.worldcubeassociation.org/results/misc/export.html 2> /dev/null | grep -o -e '>WCA_export[0-9]*_[0-9]*.sql.zip' | sed 's/>//g'¥` 

# Downloading WCA export if it's uploaded
if test "$name" != `cat latest` -o -e latest
then 
  echo $name > latest
  wget https://www.worldcubeassociation.org/results/misc/${name}
  unzip -o $name
  rm $name
  mysql -u (username) -p(password) (database) < WCA_export.sql
fi
