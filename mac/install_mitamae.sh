#!/bin/bash -xe

# See. https://github.com/itamae-kitchen/mitamae/releases
readonly MITAMAE_VERSION="1.14.0"

rm -f bin/*

machine=$(uname -m)
case "${machine}" in
"x86_64" )
  archive_name="mitamae-x86_64-darwin"
  ;;
"arm64" )
  archive_name="mitamae-aarch64-darwin"
  ;;
* )
  echo "${machine} is unknown machine"
  exit 1
  ;;
esac

pushd bin/

curl -OL https://github.com/itamae-kitchen/mitamae/releases/download/v${MITAMAE_VERSION}/${archive_name}.tar.gz
tar -zxf ${archive_name}.tar.gz
mv ${archive_name} mitamae

popd
