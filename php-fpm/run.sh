#!/bin/sh

if [ "${uid}" != "" ]
then
    usermod -u $uid www-data
fi

php-fpm