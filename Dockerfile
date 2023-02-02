FROM php:7.4-fpm

RUN apt-get update
RUN apt-get install -y zlib1g-dev libxml2-dev libzip-dev zip unzip gnupg2 git ssh rsync libfreetype6-dev libjpeg62-turbo-dev libpng-dev libmagickwand-dev

#Install the pecl packages (the libs are downloaded in the upper part)
RUN docker-php-ext-install gd zip intl mysqli pdo pdo_mysql opcache zip bcmath -j$(nproc) iconv
RUN docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/
RUN docker-php-ext-install -j$(nproc) gd && rm -r /var/lib/apt/lists/*

#Installing php lib
RUN pecl install imagick
# Nota: rimuovere il numero di versione di xdebug dopo che si è aggiornato PHP alla v8.x
RUN pecl install xdebug-3.1.5

RUN docker-php-ext-enable imagick

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
