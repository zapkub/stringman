#!/usr/bin/env bash
set -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PWD=$(pwd)
USER=$(whoami)

cp $DIR/concatman.service.tmpl /etc/systemd/system/concatman.service
cp $DIR/echoman.service.tmpl /etc/systemd/system/echoman.service

# replace template variable with current directory of application
sed -i "s|{{WORKING_DIR}}|$DIR|g" /etc/systemd/system/concatman.service
sed -i "s|{{USER}}|$USER|g" /etc/systemd/system/concatman.service

sed -i "s|{{WORKING_DIR}}|$DIR|g" /etc/systemd/system/echoman.service
sed -i "s|{{USER}}|$USER|g" /etc/systemd/system/echoman.service

echo "Application install completed! execute start.sh to start the service"