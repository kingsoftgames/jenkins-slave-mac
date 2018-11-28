#!/bin/bash

readonly BREW_PKG_LIST=(
  wget
  htop
  tree
  jq
  coreutils
)

readonly BREW_PKGS=$(IFS=' '; echo "${BREW_PKG_LIST[*]}")

brew install $BREW_PKGS
