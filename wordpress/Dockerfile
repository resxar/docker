FROM ubuntu:18.04

LABEL maintainer="muhammadshulkhan@gmail.com"

ENV LANG=C.UTF-8
ENV WP_ROOT=/var/www/html/wordpress
ENV MYSQL_HOST=localhost
ENV MYSQL_DATABASE=wordpress
ENV MYSQL_USER=wordpress_user
ENV MYSQL_PASSWORD=wordpress_password
ENV TZ=Asia/Jakarta
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update
RUN apt-get install -y curl apache2 libapache2-mod-php7.2 \
    # Install php 7.2
    php7.2 php7.2-cli php7.2-gd php7.2-mbstring php7.2-json php7.2-curl php7.2-fpm php7.2-mysqli php7.2-soap php7.2-xml php7.2-zip php7.2-intl \
    # Another Tools
    wget curl nano git \
    && apt-get update --fix-missing \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Enable php7.2 FPM in apache
RUN a2enmod proxy_fcgi setenvif \
    && a2enconf php7.2-fpm \
    && service apache2 restart

# Install Wordpress
RUN cd /tmp && wget -c http://wordpress.org/latest.tar.gz
RUN tar -xf /tmp/latest.tar.gz --directory /var/www/html
RUN mv $WP_ROOT/wp-config-sample.php $WP_ROOT/wp-config.php

# ADD php7.2-fpm.conf /etc/apache2/conf-available/php7.2-fpm.conf
# ADD php7.2.conf /etc/apache2/mods-available/php7.2.conf
# ADD php7.2.load /etc/apache2/mods-available/php7.2.load

ADD wordpress /etc/apache2/sites-available/wordpress
RUN ln -sf /etc/apache2/site-available/wordpress /etc/apache2/sites-enabled/wordpress

ADD ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

EXPOSE 80 8000
ENTRYPOINT [ "/bin/bash", "/entrypoint.sh" ]
