#! /bin/bash

DEBIAN_FRONTEND=noninteractive

# Dead PikaOS3 Release Quirk??
apt-get install libglib2.0-0=2.78.0-2 libglib2.0-bin=2.78.0-2 libglib2.0-dev-bin=2.78.0-2 -y --allow-downgrades

# Clone Upstream
git clone --recurse-submodules https://github.com/Aylur/ags -b v1.8.2
cd ./ags
cp -rvf ../debian ./


# Get build deps
apt-get update
apt-get build-dep ./ -y

npm install

npm install -g typescript@latest

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
