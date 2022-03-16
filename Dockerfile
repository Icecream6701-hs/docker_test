FROM ubuntu:18.04

RUN apt update &&\
  apt-get -qq -y install git curl build-essential wget

WORKDIR /tmp
RUN \
  wget https://www.openssl.org/source/openssl-1.1.1d.tar.gz &&\
  tar zxf /tmp/openssl-1.1.1d.tar.gz
  
WORKDIR /tmp/openssl-1.1.1d
RUN \
  ./config &&\
  make &&\
  make install

WORKDIR /tmp
RUN apt purge cmake &&\
  apt update -y &&\
  wget http://github.com/Kitware/CMake/releases/download/v3.17.3/cmake-3.17.3.tar.gz --no-check-certificate &&\
  tar zxf cmake-3.17.3.tar.gz &&\
  
WORKDIR /tmp/cmake-3.17.3
RUN ./bootstrap --prefix=/usr &&\
  make -j4 &&\
  make install
  
