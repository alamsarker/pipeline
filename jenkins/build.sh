#!/usr/bin/env bash

echo 'Building from sh file'

CONTAINER='php-composer-container'

if [ ! "$(docker ps -q -f name=$CONTAINER)" ]
then
    docker run --name $CONTAINER -d php-composer:1.0
fi

echo "$(docker ps)"

docker exec $CONTAINER bash -c 'composer -V'

