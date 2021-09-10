autoload -U colors && colors	# Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%} @ %{$fg[blue]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

stty stop undef		# Disable ctrl-s to freeze terminal.

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# # SSH & GPG
# unset SSH_AGENT_PID
# if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
#   export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
# fi

# export GPG_TTY=$(tty)
# gpg-connect-agent updatestartuptty /bye >/dev/null

# bindkey -v
# export KEYTIMEOUT=1
# 
# bindkey -M menuselect 'h' vi-backward-char
# bindkey -M menuselect 'k' vi-up-line-or-history
# bindkey -M menuselect 'l' vi-forward-char
# bindkey -M menuselect 'j' vi-down-line-or-history
# bindkey -v '^?' backward-delete-char
# 
# function zle-keymap-select () {
# 	case $KEYMAP in
# 		vicmd) echo -ne '\e[1 q';;      # block
# 		viins|main) echo -ne '\e[5 q';; # beam
# 	esac
# }
# 
# zle -N zle-keymap-select
# zle-line-init() {
#     zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
#         echo -ne "\e[5 q"
# }
# zle -N zle-line-init
# echo -ne '\e[5 q' # Use beam shape cursor on startup.
# preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.cache/zsh/history

source "$XDG_CONFIG_HOME"/shell/aliasrc
source "$XDG_CONFIG_HOME"/shell/profile
source "$XDG_CONFIG_HOME"/shell/saxo_profile
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
