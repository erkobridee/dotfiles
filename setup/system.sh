setup_chapter "CLI"

ZSHRC_STR="~/.zshrc"
ZSHRC="$HOME/.zshrc"
LOAD_SYSTEM="source \$HOME/.dotfiles/system_load.sh"

function appendSourceDotfiles() {
	echo "\n# load the .dotfiles\n$LOAD_SYSTEM\n"
}

if ! is_file $ZSHRC; then
	appendSourceDotfiles >$ZSHRC
	print_success "$ZSHRC_STR created and set to load the .dotfiles system"
elif ! file_contains_pattern $ZSHRC $LOAD_SYSTEM; then
	append "$(appendSourceDotfiles)" $ZSHRC
	print_success ".dotfiles system load added to $ZSHRC_STR"
else
	print_success ".dotfiles system is already setup on $ZSHRC_STR"
fi

unset ZSHRC_STR ZSHRC LOAD_SYSTEM
