FROM php:fpm-alpine
MAINTAINER Jacques Moati <jacques@moati.net>

RUN apk --update \
        add libzip-dev perl ttf-dejavu ttf-droid ttf-freefont ttf-liberation ttf-ubuntu-font-family libjpeg-turbo-dev libpng-dev freetype-dev icu-dev autoconf make g++ pcre-dev libtool rabbitmq-c-dev shadow git alpine-sdk automake autoconf bash wkhtmltopdf

WORKDIR /tmp

RUN git clone https://github.com/strukturag/libde265.git
WORKDIR libde265

RUN ./autogen.sh
RUN ./configure
RUN make -j install

ENV IM_VERSION 859511c029bb8e9ea02037f5672e0fd741abf414

WORKDIR ..
RUN git clone https://github.com/ImageMagick/ImageMagick.git
WORKDIR ImageMagick

RUN git reset --hard $IM_VERSION

RUN ./configure --with-heic=yes --with-jpeg=true --enable-zero-configuration --with-tiff=yes --with-webp=yes --with-raw=yes
RUN make -j install

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install iconv gd bcmath exif intl opcache pcntl sockets zip pdo_mysql calendar mysqli
RUN pecl install imagick redis amqp

RUN docker-php-ext-enable imagick amqp redis

COPY php.ini /usr/local/etc/php/

RUN rm -rf /tmp/*
RUN apk del --purge autoconf g++ libtool automake

WORKDIR /tmp
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === '48e3236262b34d30969dca3c37281b3b4bbe3221bda826ac6a9a62d6444cdb0dcd0615698a5cbe587c3f0fe57a54d8f5') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/bin/composer

WORKDIR /tmp
RUN wget https://github.com/clue/phar-composer/releases/download/v1.0.0/phar-composer.phar
RUN mv phar-composer.phar /usr/local/bin/phar-composer
RUN chmod +x /usr/local/bin/phar-composer

RUN phar-composer build https://github.com/Jmoati/rabbit-setup.git
RUN mv rabbit-setup.phar /usr/local/bin/rabbit-setup
RUN chmod +x /usr/local/bin/rabbit-setup

WORKDIR /app

COPY run.sh /run.sh

CMD /run.sh
