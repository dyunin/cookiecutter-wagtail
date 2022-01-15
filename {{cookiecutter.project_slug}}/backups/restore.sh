#!/bin/bash - 

set -o nounset                              # Treat unset variables as an error

docker-compose -f deploy.yml run --rm postgres backups
echo -e ""
echo -e "-----------------------------------------------------"
read -r -p 'Enter backup file name ' backup
docker-compose -f deploy.yml run --rm postgres restore "$backup"
