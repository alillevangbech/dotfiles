# zsh profile file. Runs on login. Environmental variables are set here.
# to clean up

#

# Adds '~/.local/bin' to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin" | cut -f2 | paste -sd ':')"

# default programs;
export EDITOR="nvim"
export TERM="st"
export BROWSER="brave"
export READER="zathura"

# pass variables;
export PASSWORD_STORE_DIR=$HOME"/Sync/sharelillevang/albec/.password-store"
