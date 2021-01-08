#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PWD=$(pwd)
GOOS=linux
GOARCH=amd64
out_dir=stringman-$GOOS-$GOARCH

tarball_path=./dist/$out_dir.tar.gz

[ ! -f $tarball_path ] && echo -n "tarball file for deployment not found: " $tarball_path && exit 1
[ -z $username ] && echo -n "Server: " && read server
[ -z $username ] && echo -n "Username: " && read username
[ -z $password ] && echo -n "Password: " && read -s password
if [ -z $port ]; then
    port=22
fi

RSYNC_PASSWORD=$password
rsync -e 'ssh -p '$port -avzh $tarball_path $username@$server:/home/$username
echo "Shipping bundle to $server is done. Please install your application by running install.sh on target server"