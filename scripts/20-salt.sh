#!/bin/bash

set -e

readonly SALT_VERSION="2018.3.3"
readonly SALT_MASTER="salt.intranet.rog2.org"

function install_pkg {
  local readonly pkg_path=$1
  sudo installer -pkg "$pkg_path" -target LocalSystem
}

function install_salt {
  local readonly version=$1
  local readonly pkg_name="salt-${version}-py3-x86_64.pkg"
  local readonly dest_pkg_path="/tmp/${pkg_name}"
  # Downloaded from https://repo.saltstack.com/#osx
  # Documentations at https://docs.saltstack.com/en/latest/topics/installation/osx.html
  local readonly download_url="https://s3.intranet.rog2.org/software/salt/${pkg_name}"

  /usr/bin/curl -o "$dest_pkg_path" "$download_url" --location --silent --fail --show-error
  install_pkg "$dest_pkg_path"
}

function configure_salt_minion {
  local readonly master=$1
  local readonly minion_id=$(hostname)

  # Workaround issue that $PATH of salt-minion lacks /usr/local/bin
  # https://github.com/saltstack/salt/issues/49348
  sudo tee "/opt/salt/bin/start-salt-minion.sh" << EOF
#!/bin/bash
export PATH="/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
exec /opt/salt/bin/salt-minion \$@
EOF

  sudo /usr/local/sbin/salt-config --master "$master" --minion-id "$minion_id"
}

function run {
  install_salt "$SALT_VERSION"
  configure_salt_minion "$SALT_MASTER"
}

run
