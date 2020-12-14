autoload -U colors && colors	# Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%} @ %{$fg[blue]%}%~%{$fg[red]%}]%{$reset_color%}$%b "


autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.


stty stop undef		# Disable ctrl-s to freeze terminal.

source "$HOME"/.aliases
source "$HOME"/.config/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
