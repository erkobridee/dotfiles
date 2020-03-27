# loads the useful stuff to make it available
# on the interactive terminal

# it should be loaded on the ~/.zshrc file
# source ~/.dotfiles/system_load.sh

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

if [ -d "$HOME/.dotfiles" ]; then
	DOTFILES_DIR="$HOME/.dotfiles"
else
	echo "Unable to find dotfiles."
	return
fi

# load the utilities
source $DOTFILES_DIR/helpers/_load

prepend_path "$DOTFILES_DIR/bin"

# load the system utilities
source $DOTFILES_DIR/system/_load

# Remove duplicates (preserving prepended items)
# Source: http://unix.stackexchange.com/a/40755
PATH=$(echo -n $PATH | awk -v RS=: '{ if (!arr[$0]++) {printf("%s%s",!ln++?"":":",$0)}}')

export DOTFILES_DIR PATH
