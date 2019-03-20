#!/bin/bash

/usr/bin/xcode-select --install

# Enable "Developer mode"
sudo /usr/sbin/DevToolsSecurity -enable
# Add "staff" group to "_developer" group,
# so admin password is not required when debugging with Xcode
sudo /usr/sbin/dseditgroup -o edit -t group -a staff _developer
