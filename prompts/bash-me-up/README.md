<h1 align="center">
	<a href="https://github.com/fehawen/bash-prompts-monorepo">
		<img alt="Bash Me Up" src="https://user-images.githubusercontent.com/36552788/45226717-f1cc5d00-b2bf-11e8-98a0-dd0aaf864782.png" width="800">
	</a>
	<br>
	<br> Hyper with Bash Me Up config. <br>
</h1>

## About

An easy-to-set-up configuration for Hyper to get a *bash* shell environment with a lovely little easy-to-read Git status output (for dummies like me), Node/NPM version, and some fancy schmancy Font Awesomeness icons to give it that extra juicy look. Gotta look pretty when coding, don't we?

## Installation

### Bash

**1.** Run the `setup.sh` script inside the `bash-me-up/` folder.
```bash
./setup.sh
```

**2.** Install the `FontAwesome` stack.

**3.** Read comments in `.bash_me_up` for further details/options, etc.

### Hyper

**Hyper** download link [here](https://hyper.is/)

In the `setup.sh` installation, choose to include the **Hyper** config when asked. This will set the correct colors, font stack, etc.

Everything should work fine at this point, except for the *Operator Mono* font (which you'll have to procure yourself, if you want to use that font). Otherwise change the font in the `.hyper.js` settings to whatever font you like, but leave the Font Awesomeness stack unchanged. 

### VS Code

If you use **VS Code** and prefer to use the integrated terminal, the **Bash Me Up** config still works as long as you have *bash* set to your default shell. Probably works for any other editor featuring an integrated terminal, but I'll leave that up to you to try out.

To make sure you get the delicious Font Awesomeness icon sweetness, make sure to include the font stack in your VS Code *User Settings*:

```javascript
{
// whatever comes before
"editor.fontFamily": "'Operator Mono', 'FontAwesome', 'Font Awesome 5 Brands', 'Font Awesome 5 Free Solid', 'Font Awesome 5 Free Regular'",
// whatever comes after
}

```
And of course change *Operator Mono* to whatever font you prefer.

### iTerm / Terminal

The **Bash Me Up** config will still work in both *iTerm2* and *Terminal* as long as the shell is set to `bash`.

However, since neither of them (to my knowledge) allow the user to set a font stack, the icons will display as either empty boxes or question marks, so you might want to exclude them in the output – i.e. manually remove the icons where they are included in the output in `.bash_me_up`.

### FontAwesome

**FontAwesome 4** download link [here](https://fontawesome.com/v4.7.0/assets/font-awesome-4.7.0.zip).

**FontAwesome 5** download link [here](https://use.fontawesome.com/releases/v5.6.3/fontawesome-free-5.6.3-desktop.zip).

## Got it, git it, good

Everything should work properly, I think. Or at least it works for me. Please don't goddam *troll* me if it doesn't work for you. Google is your friend, but I am not.

Oh, and I should probably tell you that I have no idea whatsoever how to actually code in *bash*, but somehow I managed to put this config together nonetheless. Google is apparently my friend, too.

Good luck, and may the Source be with you.