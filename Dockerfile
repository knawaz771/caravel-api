FROM php:8.3-fpm

WORKDIR /app

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN apt-get update && apt-get install -y \
    git \
    unzip \
    zip \
    libzip-dev \
    libsqlite3-dev

RUN docker-php-ext-install pdo pdo_mysql pdo_sqlite zip

COPY . .

CMD ["php-fpm"]