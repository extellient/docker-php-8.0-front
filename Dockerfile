FROM debian:buster-slim
RUN apt-get update && apt-get install -y wget gnupg2 libzip4 apt-transport-https lsb-release ca-certificates && \
    wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list && \
    apt-get update && apt-get install -y php8.1 php8.1-intl php8.1-gd php8.1-soap php8.1-apcu git curl \
    php8.1-cli php8.1-curl php8.1-pgsql php8.1-ldap php8.1-dom \
    php8.1-sqlite php8.1-mysql php8.1-zip php8.1-xml \
    php8.1-mbstring php8.1-dev make libmagickcore-6.q16-2-extra unzip \
    php8.1-redis php8.1-imagick php8.1-dev php-xdebug \
    libsystemd-dev && \
    apt-get autoremove -y && apt-get autoclean && apt-get clean && \
    rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/* \
RUN phpenmod xml simplexml mbstring mysql ldap gd dom
# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer --version
# Install node npm
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get install -y nodejs
