#!/usr/bin/env bash

docker run \
  --name=test-phpldapadmin \
  -e PUID="$(id -u)" \
  -e PGID="$(id -g)" \
  -v /home/jrichardson/Documents/code/teknofile/tkf-docker-phpldapadmin/test:/config \
  -p 30080:80 \
  teknofile/tkf-docker-phpldapadmin:devel
