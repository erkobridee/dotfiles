#!/bin/sh
#
# This script should be run via curl:
#   sh -c "$(curl -fsSL https://raw.githubusercontent.com/erkobridee/dotfiles/master/remote_install.sh)"
# or wget:
#   sh -c "$(wget -qO- https://raw.githubusercontent.com/erkobridee/dotfiles/master/remote_install.sh)"
#
set -e

REMOTE='https://github.com/erkobridee/dotfiles'
TARGET="$HOME/.dotfiles"

trap 'ret=$?; test $ret -ne 0 && printf "failed\n\n" >&2; exit $ret' EXIT

command_exists() {
	command -v "$@" >/dev/null 2>&1
}

# Ensure Apple's command line tools are installed
setup_xcode_cli() {
	if ! command_exists cc; then
		echo "Installing xcode ..."
		xcode-select --install
	else
		echo "Xcode already installed. Skipping."
	fi
}

clone_and_install() {
	git clone $REMOTE $TARGET
	cd $TARGET
	sh install.sh
}

main() {
	echo 'Boostrapping ...'
	setup_xcode_cli
	clone_and_install
}

main "$@"
