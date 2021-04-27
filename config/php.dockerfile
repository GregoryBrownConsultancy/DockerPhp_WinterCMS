FROM php:7.4-fpm-alpine

ENV BUILD_DEPS autoconf file gcc libc-dev make g++ pkgconf re2c git

RUN apk add --update --no-cache --virtual .build-deps $BUILD_DEPS
RUN apk add --no-cache --virtual .php-build-deps \
        libsodium \
        freetype-dev \
        libmcrypt-dev \
        postgresql-dev  \
        libxml2-dev  \
        libzip-dev \
        libcurl \
        libpng-dev \
        autoconf \
        libtool \
        nasm \
        zlib-dev cyrus-sasl-dev libmemcached-dev

RUN NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1)
## Installable modules
RUN docker-php-ext-install iconv bcmath pdo_mysql opcache pgsql pdo_pgsql soap pcntl exif zip gd calendar dom json
## just good to have installed
RUN apk add --no-cache  ca-certificates wget

RUN  cd ~ \
    && curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

## Install dependencies like editor xdebug etc.
RUN apk update && apk add --no-cache vim g++ make zlib-dev \
        $BUILD_DEPS \
        && pecl install xdebug && docker-php-ext-enable xdebug \
        && rm -rf /var/cache/apk/*
RUN pecl install redis \
    &&  docker-php-ext-enable redis
