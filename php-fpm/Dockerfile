FROM php:fpm

RUN apt-get update && apt-get install -y --no-install-recommends \
  git unzip pkg-config \
  libonig-dev \
  libzip-dev libicu-dev libxslt1-dev libpq-dev \
  libjpeg62-turbo-dev libpng-dev libfreetype6-dev \
  librabbitmq-dev libmagickwand-dev \
  && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure gd --with-jpeg --with-freetype \
 && docker-php-ext-install -j$(nproc) \
    gd intl opcache pdo pdo_mysql pdo_pgsql zip mbstring exif xsl bcmath pcntl sockets mysqli


RUN pecl install imagick && docker-php-ext-enable imagick \
 && pecl install amqp && docker-php-ext-enable amqp

COPY php.ini /usr/local/etc/php/

WORKDIR /app
