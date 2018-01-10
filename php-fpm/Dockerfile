FROM php:fpm-alpine3.7
MAINTAINER Jacques Moati <jacques@moati.net>

RUN apk --update \
        add perl libjpeg-turbo-dev libpng-dev freetype-dev icu-dev autoconf make g++ imagemagick-dev imagemagick pcre-dev libtool rabbitmq-c-dev shadow

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install iconv gd bcmath exif intl opcache pcntl sockets zip pdo_mysql calendar mysqli
RUN pecl install imagick amqp redis
RUN docker-php-ext-enable imagick amqp redis

RUN apk del --purge autoconf g++ libtool

COPY php.ini /usr/local/etc/php/
COPY run.sh /run.sh

CMD /run.sh
