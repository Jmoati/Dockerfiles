FROM php:cli
MAINTAINER Jacques Moati <jacques@moati.net>

RUN apt-get update
RUN apt-get install -y ufraw libzip-dev libpng-dev libfreetype6-dev libicu-dev libpcre2-dev libtool librabbitmq-dev libmagick++-dev imagemagick libpq-dev libwebp-dev
RUN docker-php-ext-configure gd --with-jpeg --with-webp
RUN docker-php-ext-install gd bcmath exif intl opcache pcntl sockets zip pdo_mysql calendar mysqli pdo_pgsql
RUN pecl install imagick redis amqp
RUN docker-php-ext-enable imagick amqp redis

COPY php.ini /usr/local/etc/php/

WORKDIR /app
