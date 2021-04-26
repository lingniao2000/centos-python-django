#!/usr/bin/env bash

VENDOR_ROOT=~/vendors

echo "----install from vendors begin----"

# 遍历目录
# shellcheck disable=SC2045
for file in $(ls ${VENDOR_ROOT}); do
  if [ -d ${VENDOR_ROOT}/"${file}" ]; then
    bash "${VENDOR_ROOT}/${file}/installer.sh" "${VENDOR_ROOT}/${file}"
  fi
done

echo "----install from vendors stop----"
