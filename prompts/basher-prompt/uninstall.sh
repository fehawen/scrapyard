#!/bin/bash

red="$(tput setaf 1)"
green="$(tput setaf 2)"
magenta="$(tput setaf 5)"
cyan="$(tput setaf 6)"
white="$(tput setaf 7)"
grey="$(tput setaf 8)"
bold="$(tput bold)"
reset="$(tput sgr0)"

initialize() {
	read -r -p "${green}Uninstall basher-prompt? ${reset}[y/N] " answer
	if [ "$answer" != y ] && [ "$answer" != Y ]; then
		echo "${red}Uninstallation cancelled${reset}"
		exit
	else
		not_installed
	fi
}

not_installed() {
	echo "Looking for existing installation..."
	if [ ! -d ~/.basher-prompt/ ]; then
		echo "${red}You don't have basher-prompt installed.${reset}"
		echo "Uninstallation cancelled"
		exit
	else
		uninstall_basher_prompt
	fi
}

uninstall_basher_prompt() {
	local preserve_npm=false

	echo "${green}Uninstalling basher-prompt...${reset}"

	echo "Looking for ~/.npm_global in path..."
	if $(echo "$PATH" | command grep '/.npm-global/' &> /dev/null); then
		preserve_npm=true
		echo "Found ~/.npm_global in path"
		echo "Path will be preserved"
	else
		echo "Found no ~/.npm_global in path"
	fi

	echo "Removing ~/.basher-prompt/"
	rm -rf ~/.basher-prompt

	echo "Removing ~/.bash_profile symlink"
	rm ~/.bash_profile

	echo "Removing ~/.bashrc symlink"
	rm ~/.bashrc

	echo "Looking for original bash config backup..."
	if [ -f ~/.pre-basher-prompt-backup/.bash_profile ] || [ -h ~/.pre-basher-prompt-backup/.bash_profile ]; then
		echo "Found ~/.pre-basher-prompt-backup/.bash_profile"
		echo "Moving ~/.pre-basher-prompt-backup/.bash_profile to ~/.bash_profile"
		mv ~/.pre-basher-prompt-backup/.bash_profile ~/.bash_profile
	else
		echo "Found no ~/.pre-basher-prompt-backup/.bash_profile"
	fi

	if [ -f ~/.pre-basher-prompt-backup/.bashrc ] || [ -h ~/.pre-basher-prompt-backup/.bashrc ]; then
		echo "Found ~/.pre-basher-prompt-backup/.bashrc"
		echo "Moving ~/.pre-basher-prompt-backup/.bashrc to ~/.bashrc"
		mv ~/.pre-basher-prompt-backup/.bashrc ~/.bashrc
	else
		echo "Found no ~/.pre-basher-prompt-backup/.bashrc"
	fi

	if [ -d ~/.pre-basher-prompt-backup/ ]; then
		rm -rf ~/.pre-basher-prompt-backup/
	fi

	if [ -f ~/.bash_profile ] || [ -h ~/.bash_profile ]; then
		echo "Restored to previous ~/.bash_profile"
	else
		echo "Creating ~/.bash_profile"
		printf '#!/bin/bash' >> ~/.bash_profile
		printf '%s\nsource ~/.bashrc' >> ~/.bash_profile
	fi

	if [ ! -f ~/.bashrc ] || [ ! -h ~/.bashrc ]; then
		echo "Restored to previous ~/.bashrc"
	else
		echo "Creating ~/.bashrc"
		printf '#!/bin/bash' >> ~/.bashrc
		printf '%s\nPS1="\u in \w $ "'
	fi

	if [ $preserve_npm ]; then
		local path_exists=$(cat ~/.bash_profile && cat ~/.bashrc 2> /dev/null)

		if $(echo "$path_exists" | command grep 'PATH' &> /dev/null); then
			echo "Path already exists, no changes will be made."
		else
			echo "Preserving ~/.npm-global in path"
			printf '%s\nPATH="~/.npm-global/bin:$PATH"' >> ~/.bashrc
		fi
	fi

	echo "${green}Uninstallation completed${reset}"
	echo "Please restart your terminal"
}

initialize