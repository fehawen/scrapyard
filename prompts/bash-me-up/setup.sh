#!/bin/bash

red="$(tput setaf 1)"
green="$(tput setaf 2)"
cyan="$(tput setaf 6)"
reset="$(tput sgr0)"

include_hyper=false

initialize() {
	read -r -p "${cyan}Install bash-me-up? ${reset}[y/N] " answer
	if [ "$answer" != y ] && [ "$answer" != Y ]; then
		echo "${red}Installation declined${reset}"
		exit
	else
		setup_bash_prompt
	fi
}

setup_bash_prompt() {

	read -r -p "${cyan}Include Hyper config? ${reset}[y/N] " answer
	if [ "$answer" != y ] && [ "$answer" != Y ]; then
		echo "${red}Excluding Hyper config...${reset}"
	else
		include_hyper=true
		echo "${green}Including Hyper config...${reset}"
	fi

	echo "${green}Installing bash-me-up...${reset}"

	echo "Sourcing .bashrc in .bash_profile..."
	
	if [ -f $HOME/.bash_profile ]; then
		rm ~/.bash_profile
	fi

	touch $HOME/.bash_profile

	printf '#!/bin/bash' >> $HOME/.bash_profile
	printf '%s\nsource $HOME/.bashrc' >> $HOME/.bash_profile

	echo "Sourcing .bash_me_up in .bashrc..."

	if [ -f $HOME/.bashrc ]; then
		rm $HOME/.bashrc
	fi

	touch $HOME/.bashrc

	printf '#!/bin/bash' >> $HOME/.bashrc
	printf '%s\nsource $HOME/.bash_me_up' >> $HOME/.bashrc

	echo "Symlinking .bash_me_up..."
	ln -sf "$(pwd)/.bash_me_up" $HOME

	echo "Creating .hushlogin for muted terminal login message..."

	if [ -f $HOME/.hushlogin ]; then
		rm $HOME/.hushlogin
	fi

	touch $HOME/.hushlogin

	if [ $include_hyper ]; then
		echo "Symlinking .hyper.js..."

		if [ -f $HOME/.hyper.js ]; then
			rm $HOME/.hyper.js
		fi

		ln -sf "$(pwd)/.hyper.js" $HOME
	fi

	echo "Checking which shell..."
	if $(echo "$SHELL" | command grep -i '/bin/bash' &> /dev/null); then
		echo "Shell is already set to $SHELL"
	else
		echo "Shell is set to $SHELL"
		echo "Changing shell to /bin/bash"
		chsh -s /bin/bash
	fi

	echo "${green}bash-me-up installed.${reset}"
	echo "Enter ${cyan}source ~/.bashrc${reset} to reload prompt"
	echo "Remember to install the FontAwesome font stack."
	echo "See README for details."
}

initialize