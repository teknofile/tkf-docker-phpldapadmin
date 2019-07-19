# Needs this old ass version because of phpLDAPadmin incompatibilities
FROM lsiobase/alpine:3.5

# set version label
ARG BUILD_DATE
ARG VERSION
ARG PHPLDAPADMIN_VERSION="1.2.4"

LABEL build_version="teknofile.org version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="teknofile <teknofile@teknofile.org>"

RUN \
  echo "** Install the runtime packages" && \
  apk add --no-cache --upgrade \
    apache2 \
    apache2-utils \
    php7-apache2 \
    php7-ldap \
    php7-common \
    php7-intl \
    php7-gettext \
    php7-mcrypt \
    php7-mbstring \
    php7-session \
    php7-xml \
    libmcrypt \
    curl \
    unzip \
    ca-certificates \
    openssl \
    openldap-clients

RUN rm -f /etc/apache2/httpd.conf 
RUN curl -o /var/www/phpldapadmin.tar.gz -L https://github.com/leenooks/phpLDAPadmin/archive/${PHPLDAPADMIN_VERSION}.tar.gz
RUN mkdir -p /var/www/phpldapadmin
RUN tar zxf /var/www/phpldapadmin.tar.gz -C /var/www/phpldapadmin/ --strip 1
RUN rm -f /var/www/phpldapadmin.tar.gz
RUN ln -s /config/www/config.php /var/www/phpldapadmin/config/config.php

COPY root/ /


VOLUME /config
EXPOSE 80 443
