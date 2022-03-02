FROM debian:buster-slim
RUN apt-get update && apt-get install -y wget gnupg2 libzip4 apt-transport-https lsb-release ca-certificates && \
    wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list && \
    apt-get update && apt-get install -y php8.0 php8.0-intl php8.0-gd php8.0-soap php8.0-apcu git curl \
    php8.0-cli php8.0-curl php8.0-pgsql php8.0-ldap \
    php8.0-sqlite php8.0-mysql php8.0-zip php8.0-xml \
    php8.0-mbstring php8.0-dev make libmagickcore-6.q16-2-extra unzip \
    php8.0-redis php8.0-imagick php8.0-dev php-xdebug \
    libsystemd-dev && \
    apt-get autoremove -y && apt-get autoclean && apt-get clean && \
    rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/*
# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer --version
# Install node npm
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get install -y nodejs
