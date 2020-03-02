FROM php:7.1-fpm-alpine

# Install packages
RUN apk --no-cache add \
    bash \
    libzip-dev \
    libpng-dev \
    libjpeg-turbo-dev

# Install php extensions
RUN docker-php-ext-install zip
RUN docker-php-ext-configure gd --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install gd
RUN docker-php-ext-install pdo_mysql

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer