#!/bin/bash

if [ ! -f .env ]; then
    echo "The env file '.env' do not exist, execute 'cp .env.example .env'"
    exit 1
fi

source .env

export STEAM_USER=${STEAM_USER}
export STEAM_PASSWORD=${STEAM_PASSWORD}
export ADMIN_PASSWORD=${ADMIN_PASSWORD}
export MYSQL_PASSWORD=${MYSQL_PASSWORD}
export MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}

envsubst < docker-compose.example.yml > docker-compose.yml