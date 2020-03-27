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
	print_done "setup system CLI tools"
}

function case_dock() {
	source setup/mackos/dock.sh
	print_done "setup macOS dock"
}

function case_macos() {
	print_set_vars
	source setup/prepare.sh
	case "$SUB_COMMAND" in
	ask)
		source setup/macos/ask.sh
		print_done "setup macOS asking"
		;;
	*)
		source setup/macos/default.sh
		print_done "setup macOS applying defaults"
		;;
	esac
	print_unset_vars
}

function case_default() {
	source setup/_run
}

case "$COMMAND" in
system)
	case_system
	;;
dock)
	case_dock
	;;
macos)
	case_macos
	;;
*)
	case_default
	;;
esac

unset DOTFILES_ROOT COMMAND SUB_COMMAND
