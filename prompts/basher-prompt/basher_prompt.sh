#!/bin/bash

black="\001$(tput setaf 0)\002"
red="\001$(tput setaf 1)\002"
green="\001$(tput setaf 2)\002"
yellow="\001$(tput setaf 3)\002"
blue="\001$(tput setaf 4)\002"
magenta="\001$(tput setaf 5)\002"
cyan="\001$(tput setaf 6)\002"
white="\001$(tput setaf 7)\002"
grey="\001$(tput setaf 8)\002"
bold="\001$(tput bold)\002"
reset="\001$(tput sgr0)\002"

icon_gitbranch="\xEE\x82\xA0"
icon_prompt="\xE2\x86\x92"

newline='
'

command_exists () {
	command -v $1 > /dev/null 2>&1
}

is_git_repository () {
	command git rev-parse --is-inside-work-tree &> /dev/null
}

user_section () {
	if [[ $UID -eq 0 ]]; then
		printf "${red}$USER ${white}in "
	fi
}

dir_section () {
	local dir get_dir=${PWD##*/}

	if [[ $(echo $PWD) == $HOME ]]; then 
		dir="~"
	elif [[ $(echo $PWD) == "$HOME/$get_dir" ]]; then
		dir="~/$get_dir"
	else
		dir=".../$get_dir"
	fi

	echo -e "${cyan}$dir "
}

git_section () {
	is_git_repository || return

	local branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
	local status=$(git status 2> /dev/null)
	local current_branch
	local current_status

	if $(echo "$status" | command grep -i 'Your branch is ahead' &> /dev/null) || $(echo "$status" | command grep -i 'Your branch is behind' &> /dev/null); then
		current_status="${grey}"
	elif $(echo "$status" | command grep -i 'Untracked files' &> /dev/null); then
		current_status="${red}"
	elif $(echo "$status" | command grep -i 'Changes not staged for commit' &> /dev/null); then
		current_status="${yellow}"
	elif $(echo "$status" | command grep -i 'Changes to be committed' &> /dev/null); then
		current_status="${green}"
	else
		current_status="${magenta}"
	fi

	if [[ $branch != "" ]]; then
		current_branch="${current_status}${icon_gitbranch} ${branch}"
	else
		current_branch="${current_status}${icon_gitbranch} n/a"
	fi

	printf "${white}on ${current_branch} "
}

timer_start() {
	timer=${timer:-$SECONDS}
}

timer_stop() {
	timer_show=$(($SECONDS - $timer))
	unset timer
}

trap timer_start DEBUG

exec_time_section () {
	local timer_limit=1

	if [[ $timer_show -ge $timer_limit ]]; then
		printf "${white}took ${green}${timer_show}s"
	fi
}

exit_section () {
	local exit_status

	if [[ $RETVAL -eq 0 ]]; then 
		exit_status="${green}"
	else
		exit_status="${red}"
	fi

	printf "${exit_status}${icon_prompt}${reset} "
}

basher_setup () {
	RETVAL=$?
	printf "${newline}${bold}$(user_section)$(dir_section)$(git_section)$(exec_time_section)${newline}$(exit_section)${reset}"
}

PROMPT_COMMAND=timer_stop
PS1="\$(basher_setup)"