#!/bin/bash
set -e

cd guacamole-server

autoreconf -fi

./configure --host=x86_64-w64-mingw32 --with-cygwin --with-telnet=no --with-ssh=no --with-rdp=no --with-vnc=no --disable-kubernetes --disable-guacenc --disable-guacd --disable-guaclog LDFLAGS="-I/usr/x86_64-w64-mingw32/include"

make
make install
