#########################################################################
# File Name: linux_apt.sh
# Author: H
# mail: ininem@163.com
# Created Time: Mon 30 Nov 2020 04:36:47 PM CST
#########################################################################
#!/bin/bash

# 基础环境
apt install gcc g++ gdb openssl libssl-dev automake autoconf make libboost-dev libmysqlclient-dev libsqlite3-dev unzip openjdk-8-jdk ant libtool
cp -r /usr/include/boost /usr/local/include/
cd /usr/lib/x86_64-linux-gnu/
ln -s libmysqlclient.so.*.*.* libmysqlclient_r.so


# cmake
tar -zxvf cmake-3.17.3.tar.gz 
cd cmake-3.17.3/
./configure 
make -j2
make install

# cd ~
cd ../

# hiredis-vip
tar -zxvf hiredis-vip.tar.gz
cd hiredis-vip-0.3.0/
make
make install

# cd ~
cd ../

# jemalloc
tar -zxvf 5.0.1.tar.gz 
cd jemalloc-5.0.1/
./autogen.sh --with-jemalloc-prefix=je_
make
make install

# cd ~
cd ../

# ragel
tar -zxvf ragel-6.10.tar.gz 
cd ragel-6.10/
./configure
make -j2
make install

# cd ~
cd ../

# protobuf
tar -zxvf protobuf-cpp-3.12.3.tar.gz 
cd protobuf-3.12.3/
./configure
make
make install

# cd ~
cd ../

# libevent
tar -zxvf libevent-2.1.11-stable.tar.gz 
cd libevent-2.1.11-stable/
./configure
make
make install

# cd ~
cd ../

# tinyxml2
tar -zxvf tinyxml2-8.0.0.tar.gz
cd tinyxml2-8.0.0/
make
make install

# cd ~
cd ../

# jsoncpp
tar -zxvf jsoncpp-1.9.3.tar.gz 
cd jsoncpp-1.9.3/
mkdir build
cd build/
cmake ..
make install

# cd ~
cd ../

# yaml-cpp
tar -zxvf yaml-cpp-0.6.3.tar.gz
cd yaml-cpp-yaml-cpp-0.6.3/
mkdir build
cd build/
cmake ..
make
make install

# cd ~
cd ../../

# cppunit
tar -zxvf cppunit-1.12.1.tar.gz cppunit-1.12.1/
cd cppunit-1.12.1/
./configure LDFLAGS='-ldl'
make
make install

# cd ~
cd ../

# zookeeper
tar -zxvf release-3.5.8.tar.gz
cd zookeeper-release-3.5.8/
ant compile_jute
cd zookeeper-client/zookeeper-client-c/
autoreconf -if
ACLOCAL="aclocal -I /usr/local/share/aclocal" autoreconf -if
ACLOCAL_PATH=/usr/local/share/aclocal autoreconf -if
ACLOCAL_FLAGS="-I /usr/local/share/aclocal" autoreconf -if
./configure
make
make install

# protoc: error while loading shared libraries: libprotoc.so.23: cannot open shared object file: No such file or directory
# 出现保存执行下面

#vim /etc/profile
# 末尾添加这一行
#export LD_LIBRARY_PATH=/usr/local/lib
#:wq
#sudo ldconfig


