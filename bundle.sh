#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PWD=$(pwd)
GOOS=linux
GOARCH=amd64
out_dir=stringman-$GOOS-$GOARCH
bundle_dir=$DIR/dist/$out_dir

# copy everything in scripts folder to bundle
cp -r $DIR/scripts/ $bundle_dir/

# compress bundle as gzip file tarball
tar -C $DIR/dist -czf $DIR/dist/$out_dir.tar.gz $out_dir

echo Create tarball file bundle completed
echo $DIR/dist/$out_dir.tar.gz