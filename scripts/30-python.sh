#!/bin/bash

set -e

readonly PYTHON2_VERSION="2.7.15"
readonly PYTHON3_VERSION="3.6.7"

function install_pkg {
  local readonly pkg_path=$1
  sudo installer -pkg "$pkg_path" -target LocalSystem
}

function install_python {
  local readonly version=$1
  local readonly pkg_name="python-${version}-macosx10.9.pkg"
  local readonly dest_pkg_path="/tmp/${pkg_name}"
  # Downloaded from https://www.python.org/downloads/
  local readonly download_url="https://s3.intranet.rog2.org/software/python/${version}/${pkg_name}"

  /usr/bin/curl -o "$dest_pkg_path" "$download_url" --location --silent --fail --show-error
  install_pkg "$dest_pkg_path"
}

function upgrade_pip {
  local readonly python_binary=$1
  $python_binary -m pip install --upgrade --user pip
}

function run {
  install_python "$PYTHON2_VERSION"
  install_python "$PYTHON3_VERSION"
  upgrade_pip /usr/local/bin/python2
  upgrade_pip /usr/local/bin/python3
}

run
