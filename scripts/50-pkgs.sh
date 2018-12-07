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

# Install crudini globally
# Note: crudini is not Python3 compatible, so we must install with pip2
sudo -H /usr/local/bin/python2 -m pip install crudini
sudo ln -sfv $(/usr/local/bin/python2-config --prefix)/bin/crudini /usr/local/bin/crudini
