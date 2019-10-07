FROM php:fpm-alpine
MAINTAINER Jacques Moati <jacques@moati.net>

ENV IM_VERSION 859511c029bb8e9ea02037f5672e0fd741abf414

RUN apk --update \
    add libzip-dev libjpeg-turbo-dev libpng-dev freetype-dev icu-dev autoconf make g++ pcre-dev libtool rabbitmq-c-dev shadow git alpine-sdk automake autoconf && \
    cd /tmp && \
    git clone https://github.com/strukturag/libde265.git && \
    cd libde265 && \
    ./autogen.sh && \
    ./configure && \
    make -j install && \
    cd .. && \
    git clone https://github.com/ImageMagick/ImageMagick.git && \
    cd ImageMagick && \
    git reset --hard $IM_VERSION && \
    ./configure --with-heic=yes --with-jpeg=true --enable-zero-configuration --with-tiff=yes --with-webp=yes --with-raw=yes && \
    make -j install && \
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install iconv gd bcmath exif intl opcache pcntl sockets zip pdo_mysql calendar mysqli && \
    pecl install imagick redis amqp && \
    docker-php-ext-enable imagick amqp redis && \
    rm -rf /tmp/* && \
    apk del --purge autoconf g++ libtool automake

COPY php.ini /usr/local/etc/php/
COPY run.sh /run.sh

WORKDIR /app
CMD /run.sh
