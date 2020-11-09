FROM php:7.1-fpm

RUN mkdir /app
COPY . /app

RUN docker-php-ext-install pdo_mysql && docker-php-ext-enable pdo_mysql

# install phpunit
# RUN curl https://phar.phpunit.de/phpunit.phar -L > phpunit.phar \
#  && chmod +x phpunit.phar \
#  && mv phpunit.phar /usr/local/bin/phpunit \
#  && phpunit --version

RUN apt-get update && apt-get install -y zlib1g-dev \
    && docker-php-ext-install zip

RUN apt-get update && apt-get install -y git

RUN apt-get update && apt-get install libxrender1
RUN apt-get update && apt-get install -y libfontconfig1

RUN apt-get install -y libxml2-dev unzip && docker-php-ext-install soap && docker-php-ext-enable soap


