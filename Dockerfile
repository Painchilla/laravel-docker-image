FROM php:latest

  # Update packages 
RUN apt-get update -yqq && apt-get install gnupg2 -yqq

  # Upgrade to Node 10
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
  
  # Install dependencies
RUN apt-get install git nodejs libcurl4-gnutls-dev libicu-dev libmcrypt-dev libvpx-dev libjpeg-dev libpng-dev libxpm-dev zlib1g-dev libfreetype6-dev libxml2-dev libexpat1-dev libbz2-dev libgmp3-dev libldap2-dev unixodbc-dev libpq-dev libsqlite3-dev libaspell-dev libsnmp-dev libpcre3-dev libtidy-dev -yqq

  # Install php extensions
RUN docker-php-ext-install mbstring pdo_mysql curl json intl gd xml zip bz2 opcache pdo_sqlite

  # Install & enable Xdebug for code coverage reports
RUN pecl install xdebug
RUN docker-php-ext-enable xdebug

