#!/usr/bin/env bash

echo "----$1 install begin----"

cd "$1" || exit

echo "1. 拷贝文件并重命名"
cp direnv.linux-amd64 direnv
chmod u+x direnv

echo "2. 添加可执行权限"
mv direnv /usr/local/bin

echo "----$1 install end----"
