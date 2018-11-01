FROM ubuntu:18.04

LABEL maintainer="muhammadshulkhan@gmail.com"

ENV TZ=Asia/Jakarta
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update
RUN apt-get install -y curl \
    apache2 \
    libapache2-mod-php7.2 \
    # Install php 7.0
    php7.2 \
    php7.2-cli \
    php7.2-gd \
    php7.2-mbstring \
    php7.2-json \
    php7.2-curl \
    php7.2-fpm \
    php7.2-mysqli \
    php7.2-soap \
    php7.2-xml \
    php7.2-zip \
    php7.2-intl \
    # Another tools
    nano \
    && apt-get update --fix-missing \
    && apt-get clean && rm -rf /var/lib/apt/lists/*
WORKDIR /var/www/html
EXPOSE 80 
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
