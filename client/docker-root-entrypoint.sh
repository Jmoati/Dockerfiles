#!/bin/sh

if [ "${uid}" != ""  ] && [ ${uid} != `id -u www-data` ] ;
then
    usermod -u $uid www-data
fi

$@