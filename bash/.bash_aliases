# ls
alias ll='ls -l'
alias lh='ls -lh'
alias la='ls -la'
alias lah='ls -lah'

# network
alias netls='sudo lsof -Pn -i | grep LISTEN'
alias netls4='sudo lsof -Pn -i4 | grep LISTEN'
alias netls6='sudo lsof -Pn -i6 | grep LISTEN'
alias netlsall='sudo lsof -Pn -i'
