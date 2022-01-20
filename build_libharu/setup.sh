#!/bin/sh
set -e

find . -mindepth 1 -maxdepth 1 ! -name 'setup.sh' ! -name 'make.bat' ! -name '*.zip' -exec rm -rvf {} \;

#curl -o zlib128.zip http://zlib.net/zlib128.zip
unzip zlib128.zip
mkdir zlib-1.2.8-build

#curl -L -o lpng1621.zip "http://downloads.sourceforge.net/project/libpng/libpng16/1.6.21/lpng1621.zip?r=&ts=1457873730&use_mirror=netix"
unzip lpng1621.zip
mkdir lpng1621-build

#curl -o libharu-RELEASE_2_3_0.zip https://codeload.github.com/libharu/libharu/zip/RELEASE_2_3_0
unzip libharu-RELEASE_2_3_0.zip
mv libharu-RELEASE_2_3_0 libharu
mkdir libharu-build

