#!/bin/bash

readonly BREW_PKG_LIST=(
  wget
  htop
  tree
  jq
  coreutils
  ifstat
)

readonly BREW_PKGS=$(IFS=' '; echo "${BREW_PKG_LIST[*]}")

brew install $BREW_PKGS

# crudini is not Python3 compatible, so we must install with pip2
pip2 install --user crudini
