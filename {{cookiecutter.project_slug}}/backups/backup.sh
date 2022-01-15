#!/bin/bash - 

set -o nounset                              # Treat unset variables as an error

cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null

if [[ -z $(/usr/local/bin/docker-compose -f deploy.yml ps -q postgres) ]] ; then
  echo 'Container Not Running'
  exit 0
else
  /usr/local/bin/docker-compose -f deploy.yml run --rm postgres backup
  docker cp $(/usr/local/bin/docker-compose -f deploy.yml ps -q postgres):/backups .
  docker cp -a $(/usr/local/bin/docker-compose -f deploy.yml ps -q django):/app/app/media ./media/$(date +%Y%m%d%H%M)-media
fi
