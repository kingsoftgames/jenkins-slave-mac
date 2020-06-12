#!/bin/bash

set -e

readonly DDC_ENDPOINT="ddc.shiyou.kingsoft.com/ddc"

# For macOS 10.15 Catalina
# https://www.fkylewright.com/2019/10/macos-catalina-10-15-autofs-mount-point-changes/
readonly MOUNT_POINT="/System/Volumes/Data/ddc"

function idpt_append {
  local readonly line="$1"
  local readonly file="$2"
  if  ! grep -q "$line" "$file" ; then
    echo "$line" | sudo tee -a "$file"
  fi
}

sudo mkdir -p "$MOUNT_POINT"

idpt_append "/-  auto_ddc" "/etc/auto_master"

sudo tee "/etc/auto_ddc" << EOF
# Unreal Engine Shared DDC
$MOUNT_POINT  -fstype=smbfs,soft,noowners,nosuid,rw  ://guest:@$DDC_ENDPOINT
EOF

sudo automount -cv
