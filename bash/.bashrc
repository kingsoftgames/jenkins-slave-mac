
# Customize bash prompt
export PS1='\u@\h:\w\$ '

# Customize terminal color
export CLICOLOR=1
export LSCOLORS=exfxaxdxcxegedabagacad

# set encoding
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Add pip3's user base binary directory to PATH
export PATH="$(python3 -m site --user-base)/bin:$PATH"

# sets environment for Java
export JAVA_HOME=$(/usr/libexec/java_home)

# Load aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
