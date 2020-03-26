#!/bin/sh
#
# installation flow to the dotfiles
#
set -e

DOTFILES_DIR=$(pwd -P)
source helpers/_load

# make sure to be able to execute those files
chmodx "$DOTFILES_DIR/bin"

load_sources setup/helpers

COMMAND=$1
SUB_COMMAND=$2

function case_system() {
	source setup/system.sh
}

function case_macos() {
	case "$SUB_COMMAND" in
	ask)
		source setup/macos/ask.sh
		;;
	*)
		source setup/macos/default.sh
		;;
	esac
}

function case_default() {
	source setup/_run
}

case "$COMMAND" in
system)
	case_system
	;;
macos)
	case_macos
	;;
*)
	case_default
	;;
esac

unset DOTFILES_ROOT COMMAND SUB_COMMAND
