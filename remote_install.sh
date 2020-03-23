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

setup_color() {
	# Only use colors if connected to a terminal
	if [ -t 1 ]; then
		RED=$(printf '\033[31m')
		GREEN=$(printf '\033[32m')
		YELLOW=$(printf '\033[33m')
		BLUE=$(printf '\033[34m')
		BOLD=$(printf '\033[1m')
		RESET=$(printf '\033[m')
	else
		RED=""
		GREEN=""
		YELLOW=""
		BLUE=""
		BOLD=""
		RESET=""
	fi
}

msg_info() {
	echo ${BLUE}"Info: $@"${RESET} >&2
}

msg_error() {
	echo ${RED}"Error: $@"${RESET} >&2
}

msg_warning() {
	echo ${YELLOW}"Warning: $@"${RESET} >&2
}

msg_success() {
	echo ${GREEN}"Success: $@"${RESET} >&2
}

#------------------------------------------------------------------------------#

command_exists() {
	command -v "$@" >/dev/null 2>&1
}

#------------------------------------------------------------------------------#

# Ensure Apple's command line tools are installed
setup_xcode_cli() {
	if ! command_exists cc; then
		msg_info "Installing xcode CLI tools..."
		xcode-select --install
		msg_success "Xcode CLI tools installed."
		echo
	else
		msg_success "Xcode already installed. Skipping."
		echo
	fi
}

clone_and_install() {
	git clone $REMOTE $TARGET
	cd $TARGET
	sh install.sh
}

#------------------------------------------------------------------------------#

main() {
	setup_color

	msg_info 'Boostrapping...'

	setup_xcode_cli
	clone_and_install
}

main "$@"
