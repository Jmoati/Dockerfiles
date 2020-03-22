FROM php:fpm-alpine
MAINTAINER Jacques Moati <jacques@moati.net>

RUN apk --update \
    add libzip-dev libjpeg-turbo-dev libpng-dev freetype-dev icu-dev pcre-dev libtool rabbitmq-c-dev shadow imagemagick imagemagick-dev postgresql-dev autoconf g++ make && \
    docker-php-ext-configure gd && \
    docker-php-ext-install iconv gd bcmath exif intl opcache pcntl sockets zip pdo_mysql calendar mysqli pdo_pgsql && \
    pecl install imagick redis amqp && \
    docker-php-ext-enable imagick amqp redis && \
    rm -rf /tmp/* && \
    apk del --purge autoconf g++ libtool

COPY php.ini /usr/local/etc/php/

WORKDIR /app
