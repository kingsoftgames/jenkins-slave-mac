#!/bin/bash

set -e

# Downloaded from https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html
readonly JAVA8_URL="https://s3.intranet.rog2.org/software/java/8/jdk-8u201-macosx-x64.dmg"
readonly JAVA8_PKG_NAME="JDK 8 Update 201.pkg"

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
  local readonly dest_path="/tmp/$(basename $url)"

  download_java8 "$url" "$dest_path"
  local readonly mount_point=$(mount_dmg "$dest_path")
  local readonly pkg_path="$mount_point/$JAVA8_PKG_NAME"
  install_pkg "$pkg_path"
  unmount_dmg "$mount_point"
}

run
