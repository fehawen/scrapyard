<h1 align="center">
	<a href="https://github.com/fehawen/bash-prompts-monorepo">
		<img alt="basher-prompt" src="https://user-images.githubusercontent.com/36552788/49886970-653fb680-fe3b-11e8-83e6-0ea18a04486c.jpg" width="333" height="500">
	</a>
	<br>
</h1>

## About

A minimalistic Bash prompt, displaying the current directory with path depth indication, git branch with color coded status, and exit code of last command.

<p align="center">
	<img alt="basher-prompt screenshot" src="https://user-images.githubusercontent.com/36552788/49887884-d7b19600-fe3d-11e8-9ed6-95f7bcefa959.jpg" width="876" height="809">
</p>

## Install

**1.** Clone the repo.
```bash
git clone https://github.com/fehawen/bash-prompts-monorepo.git
```

**2.** `cd` into the folder `basher-prompt` and run the install script.
```bash
./install.sh

# If you run into errors, try running it as sudo
sudo bash ./install.sh
```

**3.** Install your preferred [Powerline](https://github.com/powerline/fonts) font, or just go with [Fira Code](https://github.com/tonsky/FiraCode), and set it as default in your terminal emulator. This is required in order for the *git branch* icon to display properly.

**4.** Enjoy, or whatever.

## Uninstall

**1.** Clone the repo.
```bash
git clone https://github.com/fehawen/bash-prompts-monorepo.git
```

**2.** `cd` into the folder `basher-prompt` and run the uninstall script.
```bash
./uninstall.sh

# If you run into errors, try running it as sudo
sudo bash ./uninstall.sh
```

**3.** Enjoy no more.

## Credit

Goes to Denys Dovhan's [spaceship-prompt](https://github.com/denysdovhan/spaceship-prompt) for inspiration.