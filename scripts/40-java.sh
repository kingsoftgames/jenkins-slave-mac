#!/bin/bash

set -e

# Downloaded from https://docs.aws.amazon.com/corretto/latest/corretto-8-ug/downloads-list.html
readonly JAVA8_VERSION="8.262.10.1"
readonly JAVA8_URL="https://s3.shiyou.kingsoft.com/software/java/amazon-corretto/${JAVA8_VERSION}/amazon-corretto-${JAVA8_VERSION}-macosx-x64.pkg"

function install_pkg {
  local readonly pkg_path=$1
  sudo installer -pkg "$pkg_path" -target LocalSystem
}

function download_java8 {
  local readonly url=$1
  local readonly dest_path=$2
  /usr/bin/curl -o "$dest_path" "$url" --location --silent --fail --show-error
}

function mount_dmg {
  local readonly dmg_path=$1
  local readonly mount_point=$(hdiutil attach -noautoopen "$dmg_path" | egrep 'Volumes' | grep -o '/Volumes/.*')
  echo "$mount_point"
}

function unmount_dmg {
  local readonly mount_point=$1
  hdiutil detach "$mount_point"
}

function run {
  local readonly url="$JAVA8_URL"
  local readonly pkg_path="/tmp/$(basename $url)"

  download_java8 "$url" "$pkg_path"
  install_pkg "$pkg_path"
}

run
