#!/bin/bash

alias clr='clear'
alias la='ls -lah'
alias g+='git add'
alias g-='git rm'
alias gcm='git commit -m'
alias gpuom='git push -u origin master'
alias gpom='git push origin master'
alias gpuo='git push -u origin'
alias gpo='git push origin'
alias gp='git push'
alias gs='git status'
alias gss='git status -s'
alias giff='git diff'
alias glog='git log'
alias gfetch='git fetch'
alias gpull='git pull'
alias gbranch='git branch --list'
alias gbranchr='git branch -r'
alias gbranchv='git branch -v'
alias gcheck='git checkout'
alias gcheckb='git checkout -b'
alias code='open -a "Visual Studio Code"'

gconf() {
	command git config user.name $1 && git config user.email $2
}