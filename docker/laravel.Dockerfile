# https://buddy.works/guides/laravel-in-docker
FROM php:8.3.11RC2-zts-alpine3.20 AS base
RUN apt-get update -y && apt-get install -y openssl zip unzip git
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN docker-php-ext-install pdo mbstring
RUN composer create-project laravel/laravel app
WORKDIR /app
# COPY . /app
RUN composer install