function idpt_prepend_path {
  local readonly dir="$1"
  echo "$PATH" | grep -q "$dir" || export PATH="$dir:$PATH"
}

# Customize bash prompt
export PS1='\u@\h:\w\$ '

# Customize terminal color
export CLICOLOR=1
export LSCOLORS=exfxaxdxcxegedabagacad

# set encoding
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Add /usr/local/bin to PATH if not already there
# This is because /usr/local/bin is missing in the default PATH of sshd on macOS
# Use the following command to see default PATH of sshd:
#   strings /usr/sbin/sshd | grep /usr/bin
# See also: https://git-annex.branchable.com/forum/OSX__39__s_default_sshd_behaviour_has_limited_paths_set/
idpt_prepend_path "/usr/local/bin"

# Add Python's system bin directory to PATH
# Note that python3 takes precedence over python2
idpt_prepend_path "$(/usr/local/bin/python2-config --prefix)/bin"
idpt_prepend_path "$(/usr/local/bin/python3-config --prefix)/bin"

# sets environment for Java
export JAVA_HOME=$(/usr/libexec/java_home)

# Load aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi
