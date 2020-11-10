#!/bin/bash

echo 'Deploying...'

PROJECT_NAME="isalebd"
BUILD_TAR_FILE="$PROJECT_NAME.tar.gz"
REMOTE_SERVER="root@104.131.57.194"

APP_DIR="/var/www/html/${ENV_SERVER}/$PROJECT_NAME";

excludeDirs=(
    "./.git"
    "./data"
    "./."
    "./.."
    "./app/cache"
    "./app/logs"
    "./composer.phar"
    "./phpunit.phar"
    "./node_modules"
    "./bower_components"
    "./.vscode"
    "./package-lock.json"
    "./build.tar.gz"
    "./web/js/app/ng",
    "./web/css/app/less"
)

tarCommand="tar "

for dir in "${excludeDirs[@]}"
do
    tarCommand+="--exclude=$dir "
done

tarCommand+="-czf $BUILD_TAR_FILE ./"

rm -rf $BUILD_TAR_FILE
$tarCommand
 
scp $BUILD_TAR_FILE $REMOTE_SERVER:$APP_DIR/

ssh -T $REMOTE_SERVER << EOF
    cd $APP_DIR
    pwd
    tar -xvf $BUILD_TAR_FILE
    rm -rf app/cache/*
    rm -rf app/logs/*
EOF