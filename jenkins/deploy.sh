#!/bin/bash

export ENV_SERVER=$1

echo 'Deploying...'

PROJECT_NAME="isalebd"
BUILD_TAR_FILE="$PROJECT_NAME.tar.gz"
REMOTE_SERVER="root@104.131.57.194"

APP_DIR="/var/www/html/$ENV_SERVER/$PROJECT_NAME";

echo $APP_DIR
