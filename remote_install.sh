#!/bin/sh
#
# This script should be run via curl:
#   sh -c "$(curl -fsSL https://raw.githubusercontent.com/erkobridee/dotfiles/master/remote_install.sh)"
# or wget:
#   sh -c "$(wget -qO- https://raw.githubusercontent.com/erkobridee/dotfiles/master/remote_install.sh)"
#
set -e

trap 'ret=$?; test $ret -ne 0 && printf "failed\n\n" >&2; exit $ret' EXIT

REMOTE='https://github.com/erkobridee/dotfiles'
TARGET="$HOME/.dotfiles"

#------------------------------------------------------------------------------#

info() {
	printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

user() {
	printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

success() {
	printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail() {
	printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
	echo ''
	exit
}

#------------------------------------------------------------------------------#

command_exists() {
	command -v "$@" >/dev/null 2>&1
}

#------------------------------------------------------------------------------#

# Ensure Apple's command line tools are installed
setup_xcode_cli() {
	if ! command_exists cc; then
		info "Installing xcode CLI tools..."
		xcode-select --install
		success "Xcode CLI tools installed."
		echo
	else
		info "Xcode already installed. Skipping."
		echo
	fi
}

clone_and_install() {
	git clone $REMOTE $TARGET
	echo
	cd $TARGET
	sh install.sh
}

#------------------------------------------------------------------------------#

main() {
	setup_color

	echo
	info 'Boostrapping...'

	setup_xcode_cli
	clone_and_install
}

main "$@"
