FROM lsiobase/alpine:3.5

# set version label
ARG BUILD_DATE
ARG VERSION
ARG PHPLDAPADMIN_VERSION

LABEL build_version="teknofile.org version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="teknofile <teknofile@teknofile.org>"

RUN \
  echo "** Install the runtime packages" && \
  apk add --no-cache --upgrade \
    apache2 \
#    apache2-ctl \
    apache2-utils \
    php7-apache2 \
    php7-ldap \
    php7-common \
    php7-intl \
    php7-gettext \
#    php7-pecl-mcrypt \
    php7-mcrypt \
    php7-mbstring \
    php7-session \
    php7-xml \
    libmcrypt \
    curl \
    unzip

RUN rm -f /etc/apache2/httpd.conf

COPY root/ /

VOLUME /config
EXPOSE 80 443
