<h1 align="center">
	<a href="https://github.com/fehawen/bash-prompts-monorepo">
		<img alt="submariner prompt" src="https://user-images.githubusercontent.com/36552788/46587378-fc7b3d00-ca8b-11e8-8af7-f523e30da3bf.png" width="803">
	</a>
	<br>
	<br> Submariner prompt <br>
</h1>

## About

The **Submariner prompt** is a *Bash* prompt made for those of us who dwell in the deepest and darkest depths of the seas. Or whatever. It's just a *Bash* prompt that I use myself, and it happens to look amazeballs. Like, it's really cool, probably the coolest prompt you'll ever get. And as you've probably guessed, it's heavily inspired by *Zsh* prompts and themes such as [Spaceship](https://github.com/denysdovhan/spaceship-prompt) and [Agnoster](https://github.com/agnoster/agnoster-zsh-theme).

<p align="center">
  <img alt="Submariner with Hyper" src="https://user-images.githubusercontent.com/36552788/46510436-3c9ead80-c849-11e8-898d-968d9556b5ba.png" width="900">
</p>

### Prompt

| Prompt output order        |
| -------------------------- |
| User                       |
| Directory                  |
| Git branch & status        |
| Package version            |
| Node/NVM version           |
| Docker ps count            |

For details on characters and symbols representing the current Git branch status, see [Spaceship](https://github.com/denysdovhan/spaceship-prompt) for details, from which I've borrowed the structure and layout.

## Info

**Submariner prompt** is designed to match nicely alongside the *Material Theme Palenight* for **VS Code**, along with a slightly re-designed version of *Material Theme* for **Hyper** in regards to colors.

The prompt requires a **Powerline** font, found [here](https://github.com/powerline/fonts), as well as a **Font Awesome** font stack, provided herein, in order to display icons and certqin characters properly.

## Installation

### Bash

**1.** Run the `setup.sh` script inside the `submariner-prompt/` folder.
```bash
./setup.sh
```

**2.** Install the `FontAwesome` stack.

**3.** (Optional) Install the [Fira Mono for Powerline](https://github.com/powerline/fonts/tree/master/FiraMono) font, used in the example above.

### Hyper

**Hyper** download link [here](https://hyper.is/)

In the `setup.sh` installation, choose to include the **Hyper** config when asked. This will set the correct colors, font stack, etc.

If you didn't install the [Fira Mono for Powerline](https://github.com/powerline/fonts/tree/master/FiraMono) font, install whichever `Powerline` font you prefer and remember to change the first font in the *Hyper* settings. Leave the *Font Awesome* fonts in place though, in order for characters and icons to display properly.

### VS Code

If you wish to use **Submariner prompt** with the **VS Code** integrated terminal, you can include a separate `terminal.integrated.fontFamily` stack for the terminal only. This will allow you to keep whichever font you prefer in the editor, while including the required *Powerline* font of your choice along with the required *Font Awesome* stack in order for the prompt to display correctly.

```javascript
// whatever comes before
"terminal.integrated.fontFamily": "'Fira Mono for Powerline', 'FontAwesome', 'Font Awesome 5 Brands', 'Font Awesome 5 Free Solid', 'Font Awesome 5 Free Regular'",
// whatever comes after
```

In order for **Submariner prompt's** line-segment separators to display correctly in terms of color against the background color, you might also want to set *ANSII* black to match your background color with `workbench.colorCustomizations`. If you're using the recommended *Material Theme Palenight*, apply the following.

```javascript
// whatever comes before
"workbench.colorCustomizations": {
	"terminal.ansiBlack": "#292D3E",
},
// whatever comes after
```

### FontAwesome

**FontAwesome 4** download link [here](https://fontawesome.com/v4.7.0/assets/font-awesome-4.7.0.zip).

**FontAwesome 5** download link [here](https://use.fontawesome.com/releases/v5.6.3/fontawesome-free-5.6.3-desktop.zip).

If you're using any other theme, just replace `#292D3E` with whichever background color your theme is using.

## Gone diving

If things don't work properly, or if you have any questions, remember that *Google* is your friend.

Me, I'm gone diving.

Swim safe.