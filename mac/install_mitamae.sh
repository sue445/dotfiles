#!/bin/bash -xe

readonly MITAMAE_VERSION="1.5.6"

rm -f bin/*

cd bin/
wget https://github.com/itamae-kitchen/mitamae/releases/download/v${MITAMAE_VERSION}/mitamae-x86_64-darwin.tar.gz
tar -zxf mitamae-x86_64-darwin.tar.gz
cd ..
