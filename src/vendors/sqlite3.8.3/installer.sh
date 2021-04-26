#!/usr/bin/env bash

echo "----$1 install begin----"

cd "$1" || exit

echo "1. 拷贝文件并重命名"
tar zxvf sqlite-autoconf-3330000.tar.gz
cd sqlite-autoconf-3330000

echo "2. 配置并安装"
./configure --prefix=/usr/local/sqlite
make && make install
ln -sf /usr/local/sqlite/bin/sqlite3 /usr/bin/sqlite3

echo "----$1 install end----"
