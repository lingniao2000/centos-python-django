#!/usr/bin/env bash

function install_pyenv() {
  echo " [!] pyenv installing"
  curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
  echo " [!] pyenv installed"
}

function install_direnv() {
  # curl: (22) The requested URL returned error: 403 rate limit exceeded
  # 经常安装失败
  echo " [!] direnv installing"
  curl -sfL https://direnv.net/install.sh | bash
  echo " [!] direnv installed"
}

function install_default_python() {
  echo " [!] installing default python according to .python-version"
  # shellcheck disable=SC1090
  source ~/.bashrc
  # shellcheck disable=SC2046
  v=$(cat .python-version)
  wget https://npm.taobao.org/mirrors/python/"$v"/Python-"$v".tar.xz -P ~/.pyenv/cache/
  pyenv install "$v"
  rm -rf ~/.pyenv/cache/*
  echo " [!] default python installed"
}

# main process
echo "---> [!] start running post hook script <---"
install_direnv
install_pyenv
install_default_python

# shellcheck disable=SC1090
source ~/.bashrc
echo " [!] upgrade pip to latest version"
pip install --upgrade pip
echo "---> [!] end running post hook script <---"
