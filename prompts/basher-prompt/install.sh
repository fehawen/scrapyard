#!/bin/bash

red="$(tput setaf 1)"
green="$(tput setaf 2)"
cyan="$(tput setaf 6)"
reset="$(tput sgr0)"

include_npm=false

initialize() {
	read -r -p "${green}Install basher-prompt? ${reset}[y/N] " answer
	if [ "$answer" != y ] && [ "$answer" != Y ]; then
		echo "${red}Installation cancelled${reset}"
		exit
	else
		already_installed
	fi
}

already_installed() {
	echo "Looking for existing installation..."
	if [ -f ~/.basher-prompt/basher_prompt.sh ] || [ -h ~/.basher-prompt/basher_prompt.sh ]; then
		echo "${red}You have already installed basher-prompt${reset}"
		echo "Please run ${cyan}./uninstall.sh${reset} first to remove your existing installation."
		exit
	else
		pre_install
	fi
}

pre_install() {
	read -r -p "${green}Include ~/.npm-global installation in path? ${reset}[y/N] " answer
	if [ "$answer" != y ] && [ "$answer" != Y ]; then
		echo "Excluding .npm-global from path"
		echo "Path will be reset"
		install_basher_prompt
	else
		include_npm=true
		install_basher_prompt
	fi
}

install_basher_prompt() {
	echo "${green}Installing basher-prompt...${reset}"

	echo "Looking for original bash config..."
	if [ -f ~/.bash_profile ] || [ -h ~/.bash_profile ]; then
		echo "Found ~/.bash_profile"
		echo "Moving ~/.bash_profile to ~/.pre-basher-prompt-backup/"
		mkdir -p ~/.pre-basher-prompt-backup/
		mv ~/.bash_profile ~/.pre-basher-prompt-backup/
	else
		echo "Found no ~/.bash_profile"
	fi

	if [ -f ~/.bashrc ] || [ -h ~/.bashrc ]; then
		echo "Found ~/.bashrc"
		echo "Moving ~/.bashrc to ~/.pre-basher-prompt-backup/"
		mkdir -p ~/.pre-basher-prompt-backup/
		mv ~/.bashrc ~/.pre-basher-prompt-backup/
	else
		echo "Found no ~/.bashrc"
	fi

	echo "Creating ~/.basher-prompt/"
	mkdir -p ~/.basher-prompt/

	echo "Copying basher_prompt.sh to ~/.basher-prompt/"
	cp "$(pwd)/basher_prompt.sh" ~/.basher-prompt/

	echo "Copying basher_aliases.sh to ~/.basher-prompt/"
	cp "$(pwd)/basher_aliases.sh" ~/.basher-prompt/

	echo "Creating .bashrc in ~/.basher-prompt/"
	printf '#!/bin/bash' >> ~/.basher-prompt/.bashrc
	printf '%s\nsource ~/.basher-prompt/basher_prompt.sh' >> ~/.basher-prompt/.bashrc
	printf '%s\nsource ~/.basher-prompt/basher_aliases.sh' >> ~/.basher-prompt/.bashrc

	if [ $include_npm ]; then
		echo "Including .npm-global in path"
		printf '%s\nPATH="~/.npm-global/bin:$PATH"' >> ~/.basher-prompt/.bashrc
	fi

	echo "Creating .bash_profile in ~/.basher-prompt/"
	printf '#!/bin/bash' >> ~/.basher-prompt/.bash_profile
	printf '%s\nsource ~/.basher-prompt/.bashrc' >> ~/.basher-prompt/.bash_profile

	echo "Symlinking ~/.basher-prompt/.bash_profile to ~/.bash_profile"
	ln -sf ~/.basher-prompt/.bash_profile ~/.bash_profile

	echo "Symlinking ~/.basher-prompt/.bashrc to ~/.bashrc"
	ln -sf ~/.basher-prompt/.bashrc ~/.bashrc

	echo "Creating ~/.hushlogin to mute terminal 'last login' messages"
	touch ~/.hushlogin

	echo "Checking which shell..."
	if $(echo "$SHELL" | command grep -i '/bin/bash' &> /dev/null); then
		echo "Shell is already set to $SHELL"
	else
		echo "Shell is set to $SHELL"
		echo "Changing shell to /bin/bash"
		chsh -s /bin/bash
	fi

	echo "${green}Installation completed${reset}"
	echo "Please restart your terminal, or type ${cyan}source ~/.bashrc${reset} to reload your prompt${reset}"
	echo "Remember to install a ${cyan}PowerLine Font${reset} and set it as default in your terminal${reset}"
}

initialize