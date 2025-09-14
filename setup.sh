#!/bin/bash

# Basic usage : ./setup

# Replace "." with "-" in $USER
CLEAN_USER="${USER//./-}"
export INSTANCE_NAME="${CLEAN_USER}-$(basename $(pwd))"

export APP_ENV=dev

ENV_FILE_PATH=".env"

if [ ! -f "${ENV_FILE_PATH}" ]; then
    cat << EOF > ${ENV_FILE_PATH}
STEAM_USER=
STEAM_PASSWORD=
ADMIN_PASSWORD=
MYSQL_PASSWORD=
MYSQL_ROOT_PASSWORD=
EOF

    echo "The env file ${ENV_FILE_PATH} has been created, please fill it"
    exit 1
fi

source .env

export STEAM_USER=${STEAM_USER}
export STEAM_PASSWORD=${STEAM_PASSWORD}
export ADMIN_PASSWORD=${ADMIN_PASSWORD}
export MYSQL_PASSWORD=${MYSQL_PASSWORD}
export MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}

docker compose -p "${INSTANCE_NAME}" --project-directory . -f ./deploy/docker-compose.yml -f ./deploy/docker-compose-pma-override.yml config > docker-compose.yml

echo "Instance '${INSTANCE_NAME}' ready"
echo
echo "\`docker compose up -d\` to start the instance"