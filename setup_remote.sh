#!/bin/sh
{ # this ensures the entire script is downloaded #

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

	#----------------------------------------------------------------------------#

	function print_info() {
		printf "\r  [ \033[0;94mINFO\033[0m ] $1\n"
	}

	function print_success() {
		printf "\r\033[2K  [ \033[0;92mOK\033[0m ] $1\n"
	}

	#----------------------------------------------------------------------------#

	function command_exists() {
		command -v "$@" >/dev/null 2>&1
	}

	#----------------------------------------------------------------------------#

	# Ensure Apple's command line tools are installed
	function setup_xcode_cli() {
		if ! command_exists cc; then
			print_info "Installing xcode CLI tools..."
			xcode-select --install
			print_success "Xcode CLI tools installed."
			echo
		else
			print_success "Xcode already installed. Skipping."
			echo
		fi
	}

	function clone_and_install() {
		git clone $REMOTE $TARGET
		echo
		cd $TARGET
		sh setup.sh
	}

	#----------------------------------------------------------------------------#

	function main() {
		print_info 'Remote dotfiles setup...'

		setup_xcode_cli
		clone_and_install
	}

	main "$@"

} # this ensures the entire script is downloaded #
