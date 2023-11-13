#!/bin/bash
set -e

wget -qO- https://github.com/glennrp/libpng/archive/refs/tags/v1.6.40.tar.gz | tar xz
pushd libpng-1.6.40

./configure --host=x86_64-w64-mingw32 --prefix=/usr/x86_64-w64-mingw32 \
    CPPFLAGS="-I/usr/x86_64-w64-mingw32/include" LDFLAGS="-L/usr/x86_64-w64-mingw32/lib/"
make
make install
popd
