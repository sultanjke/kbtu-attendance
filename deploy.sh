#!/bin/sh
set -eu

if [ ! -f .env ]; then
    echo "Missing .env; copy .env.example to .env and configure it first." >&2
    exit 1
fi

docker compose config --quiet
docker compose build --pull
docker compose up -d --remove-orphans
docker compose ps