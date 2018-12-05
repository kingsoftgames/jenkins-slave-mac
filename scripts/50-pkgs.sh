#!/bin/bash

readonly BREW_PKG_LIST=(
  wget
  htop
  tree
  jq
  coreutils
  ifstat
  watch
  smartmontools
)

readonly BREW_PKGS=$(IFS=' '; echo "${BREW_PKG_LIST[*]}")

/usr/local/bin/brew install $BREW_PKGS

# crudini is not Python3 compatible, so we must install with pip2
/usr/local/bin/pip2 install --user crudini
