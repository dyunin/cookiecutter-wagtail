#!/bin/bash - 
#===============================================================================
#          FILE: pull.sh
#       CREATED: 28.11.2021 19:15
#===============================================================================

set -o nounset                              # Treat unset variables as an error

export NGINX_IMAGE=registry.arkline.ru/django/lawncare:nginx
export DJANGO_IMAGE=registry.arkline.ru/django/lawncare:django
export POSTGRES_IMAGE=registry.arkline.ru/django/lawncare:postgres

docker pull $NGINX_IMAGE
docker pull $DJANGO_IMAGE
docker pull $POSTGRES_IMAGE
docker-compose -f deploy.yml down
docker-compose -f deploy.yml up -d
