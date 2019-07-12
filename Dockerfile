FROM lsiobase/nginx:3.9

# set version label
ARG BUILD_DATE
ARG VERSION
ARG PHPLDAPADMIN_VERSION

LABEL build_version="teknofile.org version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="teknofile <teknofile@teknofile.org>"

RUN \
  echo "** Install the runtime packages" && \
  apk add --no-cache --upgrade \
    nginx \
    php7-ldap \
    php7-mcrypt \
    curl \
    unzip 

RUN mkdir --parents /var/www/html

RUN curl -o /tmp/phpldapadmin.zip -sLX GET "https://sourceforge.net/projects/phpldapadmin/files/latest/download" 
  
  
RUN unzip /tmp/phpldapadmin.zip -d /var/www/html/



COPY root/ /


VOLUME /config
