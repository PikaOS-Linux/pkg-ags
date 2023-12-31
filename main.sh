#! /bin/bash

DEBIAN_FRONTEND=noninteractive

# Clone Upstream
git clone https://github.com/ferrreo/ags.git
cd ./ags
git checkout systray
git submodule update --init
cp -rvf ../debian ./


# Get build deps
apt-get update
apt-get build-dep ./ -y

npm install

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
