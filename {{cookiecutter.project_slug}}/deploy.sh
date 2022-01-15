#!/bin/bash - 

set -o nounset                              # Treat unset variables as an error

ssh -p12122 -o StrictHostKeyChecking=no $REMOTE_USER@$IP_ADDRESS_STAGE_SERVER << 'ENDSSH'
  export PROJECT_NAME=$(cat .project_name)
  export REMOTE_USER=$(cat .remote_user)
  cd /home/$REMOTE_USER/$PROJECT_NAME 
  export $(cat .env | xargs)
  docker login -u $CI_REGISTRY_USER -p $CI_JOB_TOKEN $CI_REGISTRY
  docker cp $(/usr/local/bin/docker-compose -f deploy.yml ps -q postgres):/backups .
  docker cp -a $(/usr/local/bin/docker-compose -f deploy.yml ps -q django):/app/app/media ./media/$(date +%Y%m%d%H%M)-media
  docker pull $NGINX_IMAGE
  docker pull $DJANGO_IMAGE
  docker pull $POSTGRES_IMAGE
  docker-compose -f deploy.yml down
  docker-compose -f deploy.yml up -d
ENDSSH
