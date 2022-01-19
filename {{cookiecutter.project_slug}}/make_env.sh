#!/bin/bash - 

set -o nounset                              # Treat unset variables as an error

env_file='.env'

echo CI_REGISTRY_USER=$CI_REGISTRY_USER                             >> "$env_file"
echo CI_JOB_TOKEN=$CI_JOB_TOKEN                                     >> "$env_file"
echo CI_REGISTRY=$CI_REGISTRY                                       >> "$env_file"  
echo IMAGE=$CI_REGISTRY/$CI_PROJECT_NAMESPACE/$CI_PROJECT_NAME      >> "$env_file"
echo NGINX_IMAGE="${IMAGE}:proxy"                                   >> "$env_file"
echo DJANGO_IMAGE="${IMAGE}:django"                                 >> "$env_file"
echo POSTGRES_IMAGE="${IMAGE}:postgres"                             >> "$env_file"  

echo DJANGO_ADMIN_NAME=$DJANGO_ADMIN_NAME                           >> "$env_file"
echo DJANGO_ADMIN_EMAIL=$DJANGO_ADMIN_EMAIL                         >> "$env_file"
echo DJANGO_ADMIN_PASSWORD=$DJANGO_ADMIN_PASSWORD                   >> "$env_file"
echo DJANGO_SETTINGS_MODULE=config.settings.production              >> "$env_file" 
echo DJANGO_SECRET_KEY=$DJANGO_SECRET_KEY                           >> "$env_file"
echo DJANGO_ALLOWED_HOSTS=$DJANGO_ALLOWED_HOSTS                     >> "$env_file"
echo WEB_CONCURRENCY=4                                              >> "$env_file"
echo REDIS_URL=redis://redis:6379/0                                 >> "$env_file"
echo MAILGUN_API_KEY=                                               >> "$env_file"
echo MAILGUN_DOMAIN=                                                >> "$env_file"

echo POSTGRES_HOST=$POSTGRES_HOST                                   >> "$env_file"
echo POSTGRES_PORT=$POSTGRES_PORT                                   >> "$env_file"
echo POSTGRES_DB=$POSTGRES_USER                                     >> "$env_file"
echo POSTGRES_USER=$POSTGRES_USER                                   >> "$env_file"
echo POSTGRES_PASSWORD=$POSTGRES_PASSWORD                           >> "$env_file"
