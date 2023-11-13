#!/bin/bash
set -e

wget -qO- http://downloads.sourceforge.net/libjpeg-turbo/libjpeg-turbo-3.0.1.tar.gz | tar xz
cd libjpeg-turbo-3.0.1

mkdir build
cd build
cmake -G"Unix Makefiles" -DCMAKE_INSTALL_PREFIX=/usr/x86_64-w64-mingw32/ -DCMAKE_TOOLCHAIN_FILE=../TC-mingw.cmake ..
make
make install
