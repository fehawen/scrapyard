#!/usr/bin/env bash

##############
### COLORS ###
##############

export bold="\[\e[1m\]"
export italic="\[\e[3m\]"
export reset="\[\e[0m\]"

export black="\[\e[1;90m\]"
export red="\[\e[1;31m\]"
export green="\[\e[1;32m\]"
export yellow="\[\e[1;33m\]"
export blue="\[\e[1;34m\]"
export magenta="\[\e[1;35m\]"
export cyan="\[\e[1;36m\]"
export white="\[\e[1;97m\]"

###################
### THEME SETUP ###
###################

THEME="base_prompt"
PROMPT_DIR=".config/prompt"
PROMPT_THEME="$PROMPT_DIR/$THEME"

# shellcheck disable=SC1090
[[ -f "$PROMPT_THEME" ]] && source "$PROMPT_THEME"

##################
### ALIAS FILE ###
##################

declare ALIAS_FILE="$PROMPT_DIR/aliasrc"

# shellcheck disable=SC1090
[[ -f "$ALIAS_FILE" ]] && source "$ALIAS_FILE"

###############
### EXPORTS ###
###############

export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="kitty"
export BROWSER="chromium"
export LC_ALL=en_US.UTF-8

# Colored man pages
export LESS_TERMCAP_mb=$'\e[0;32m'
export LESS_TERMCAP_md=$'\e[1;34m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[0;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[0;35m'

# Start X if i3 isn't running, and if on Linux (Arch)
if [[ "$OSTYPE" =~ "linux" ]]; then
	[[ "$(tty)" = "/dev/tty1" ]] && ! pgrep -x i3 >/dev/null && exec startx
fi

compose_path() {
	paths=("$@")
	# Include desired paths in PATH and export, leaving default PATH still intact and preventing duplicates
	for p in "${paths[@]}"
	do
		case ":$PATH:" in
			*":$p:"*) :;; # already there
			*) PATH="$p:$PATH";;
		esac
	done

	export PATH="${PATH}"
}

# Set PATH for macOS
if [[ "$OSTYPE" =~ "darwin" ]]; then
	paths=(
		"$HOME/.yarn/bin"
		"$HOME/.local/bin/"
		"$HOME/.npm-global/bin"
		"$HOME/Library/Python/3.7/bin"
		"$HOME/paths/mongodb-osx-x86_64-4.0.3/bin"
	)

	compose_path "${paths[@]}"
fi

# Set PATH for Linux
if [[ "$OSTYPE" =~ "linux" ]]; then
	declare -a paths=(
		"$HOME/.yarn/bin"
		"$HOME/.npm-global/bin"
		"$HOME/.local/bin"
	)

	compose_path "${paths[@]}"
fi
