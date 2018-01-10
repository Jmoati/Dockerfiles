FROM jmoati/php-fpm
MAINTAINER Jacques Moati <jacques@moati.net>

RUN apk --update add mysql-client make g++ autoconf htop supervisor sudo nodejs git openssh zsh

# not supported by php 7.2 yet
#RUN pecl install xdebug

RUN apk del --purge g++ autoconf libtool

RUN mkdir /etc/supervisor.d/
RUN echo "www-data ALL=(ALL:ALL) NOPASSWD: ALL" | (EDITOR="tee -a" visudo)

RUN cd /tmp
RUN php -r "readfile('https://getcomposer.org/installer');" | php
RUN mv composer.phar /usr/local/bin/composer

USER www-data
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"; exit 0
USER root

VOLUME /var/www
VOLUME /etc/supervisor.d

WORKDIR /home/www-data

COPY docker-entrypoint.sh /docker-entrypoint.sh
COPY docker-root-entrypoint.sh /docker-root-entrypoint.sh
COPY run.sh /run.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD /run.sh
