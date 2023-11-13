FROM ubuntu:22.04

RUN apt-get -y update
RUN apt-get -y install software-properties-common

RUN apt-get -y install \
    autoconf \
    autotools-dev \
    cmake \
    git \
    libtool \
    libz-mingw-w64-dev \
    make \
    meson \
    pkg-config \
    wget \
    gcc-mingw-w64-x86-64-win32 \
    gcc-mingw-w64-x86-64-win32-runtime

RUN git clone https://github.com/jmuehlner/guacamole-server.git \
    && cd guacamole-server \
    && git fetch && git checkout GUACAMOLE-1841-cygwin-build

COPY scripts/build-libjpeg.sh /build-libjpeg.sh
COPY config/TC-mingw.cmake /TC-mingw.cmake
RUN bash /build-libjpeg.sh

COPY scripts/build-libpng.sh /build-libpng.sh
RUN bash /build-libpng.sh

COPY config/x86_64-w64-mingw32.txt /x86_64-w64-mingw32.txt
COPY scripts/build-cairo.sh /build-cairo.sh
RUN bash /build-cairo.sh

COPY scripts/build-guac.sh /build-guac.sh
RUN bash /build-guac.sh

