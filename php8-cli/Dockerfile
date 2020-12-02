FROM php:cli-alpine
MAINTAINER Jacques Moati <jacques@moati.net>

WORKDIR /tmp

RUN apk --update upgrade && \
    apk add alpine-sdk autoconf rabbitmq-c-dev libzip-dev icu-dev bash git && \
    pecl install redis && \
    docker-php-ext-install -j$(nproc) bcmath exif intl opcache pcntl sockets zip calendar && \
    git clone https://github.com/pdezwart/php-amqp.git && \
    cd php-amqp && \
    phpize && \
    ./configure && \
    make -j && \
    make install && \
    docker-php-ext-enable redis amqp && \
    apk del alpine-sdk autoconf git && \
    rm -rf /tmp/*

COPY php.ini /usr/local/etc/php/

WORKDIR /app
