#!/bin/sh
#
# This script should be run via curl:
#   sh -c "$(curl -fsSL https://raw.githubusercontent.com/erkobridee/dotfiles/master/setup_remote.sh)"
# or wget:
#   sh -c "$(wget -qO- https://raw.githubusercontent.com/erkobridee/dotfiles/master/setup_remote.sh)"
#
set -e

echo

trap 'ret=$?; test $ret -ne 0 && printf "failed\n\n" >&2; exit $ret' EXIT

REMOTE='https://github.com/erkobridee/dotfiles'
TARGET="$HOME/.dotfiles"

#------------------------------------------------------------------------------#

info() {
	printf "\r  [ \033[0;94mINFO\033[0m ] $1\n"
}

user() {
	printf "\r  [ \033[0;93m??\033[0m ] $1\n"
}

success() {
	printf "\r\033[2K  [ \033[0;92mOK\033[0m ] $1\n"
}

fail() {
	printf "\r\033[2K  [\033[0;91mFAIL\033[0m] $1\n"
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
		success "Xcode already installed. Skipping."
		echo
	fi
}

clone_and_install() {
	git clone $REMOTE $TARGET
	echo
	cd $TARGET
	sh setup.sh
}

#------------------------------------------------------------------------------#

main() {
	info 'Boostrapping...'

	setup_xcode_cli
	clone_and_install
}

main "$@"