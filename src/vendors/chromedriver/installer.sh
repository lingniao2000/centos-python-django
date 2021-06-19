#!/usr/bin/env bash

echo "----$1 install begin----"

echo " [!] installing: google chrome stable"
yum install -y https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm

echo " [!] installing: chromedriver linux64"
DOMAIN=http://chromedriver.storage.googleapis.com
FILENAME=chromedriver_linux64.zip

VERSION=$(curl ${DOMAIN}/LATEST_RELEASE)
DRIVER=${DOMAIN}/${VERSION}/${FILENAME}
wget "${DRIVER}" && unzip ${FILENAME} && rm -rf ${FILENAME}
mv chromedriver /usr/local/bin/chromedriver
echo " [!] install end: chromedriver linux64"

echo "----$1 install end----"
