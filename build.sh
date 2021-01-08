#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PWD=$(pwd)
VERSION=$1

[ -f $VERSION ] && echo please provide version of build && exit 2

# Setup parameter
# or build enviroment
GOOS=linux
GOARCH=amd64
out_dir=stringman-$GOOS-$GOARCH

# Clean bundle directory
rm -rf $DIR/$out_dir

# Run build command
go build -o $DIR/dist/$out_dir/bin/concatman ./cmd/concatman
go build -o $DIR/dist/$out_dir/bin/echoman ./cmd/echoman

# generate metadata
echo $VERSION > $DIR/dist/$out_dir/VERSION
date > $DIR/dist/$out_dir/BUILD_IDS
git rev-parse HEAD >> $DIR/dist/$out_dir/BUILD_IDS
