FROM ubuntu:18.04

LABEL maintainer="muhammadshulkhan@gmail.com"
LABEL version="10.3"

ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=mysqldocker
ENV MYSQL_USER=docker
ENV MYSQL_PASSWORD=docker

ENV DEBIAN_FRONTEND=noninteractive

RUN set -ex; \
        apt-get update; \
        if ! which gpg; then \
                apt-get install -y --no-install-recommends gnupg; \
        fi; \
# Ubuntu includes "gnupg" (not "gnupg2", but still 2.x), but not dirmngr, and gnupg 2.x requires dirmngr
# so, if we're not running gnupg 1.x, explicitly install dirmngr too
        if ! gpg --version | grep -q '^gpg (GnuPG) 1\.'; then \
                 apt-get install -y --no-install-recommends dirmngr; \
        fi; \
        rm -rf /var/lib/apt/lists/*

#RUN apt-get install -y gnupg2
RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository 'deb [arch=amd64] http://mirror.zol.co.zw/mariadb/repo/10.3/ubuntu bionic main'
RUN apt-get update --fix-missing
RUN apt-get install -y mariadb-server mariadb-client \
    curl \
    wget \
    nano

ADD ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

VOLUME [ "/var/lib/mysql" ]

EXPOSE 3306
ENTRYPOINT [ "/bin/bash" , "/entrypoint.sh"]

CMD ["mysqld"]
