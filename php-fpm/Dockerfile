FROM php:fpm-alpine
MAINTAINER Jacques Moati <jacques@moati.net>

RUN apk --update \
        --repository http://dl-3.alpinelinux.org/alpine/v3.6/main/ \
        add perl libjpeg-turbo-dev libpng-dev freetype-dev icu-dev autoconf make g++ imagemagick-dev pcre-dev libtool rabbitmq-c-dev && \
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install iconv gd bcmath exif intl opcache pcntl sockets zip pdo_mysql calendar mysqli && \
    pecl install imagick amqp redis  && \
    docker-php-ext-enable imagick amqp redis && \ 
    apk del --purge autoconf g++ libtool && \
    rm -rf /var/cache/apk/

COPY php.ini /usr/local/etc/php/
