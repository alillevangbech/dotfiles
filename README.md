# **alillevangbech**
windows subsystem for linux dotfiles

## Essential installs;
	- git
	- zsh
	- nvim
	- man
	- tmux
	- stow

## Nice-to-have;
	- ssh
	- build-essential
	- cmake
	- python3-dev
	- texlive-full 

## Import files;
	- stow git zsh nvim tmux

## Set zsh-default shell;
	- cat /etc/shells;
	- chsh;
	- chsh -s /usr/bin/zsh;
	- (reboot here)
	- echo /usr/bin/zsh

## YouCompleteMe setup; (c family)
	- cd $HOME/.config/nvim/plugged/YouCompleteMe/
	- sudo apt install build-essential cmake python3-dev
	- python3 install.py --clangd-completer
