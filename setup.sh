#!/bin/sh
#
# setup flow to the dotfiles
#
set -e

DOTFILES_DIR=$(pwd -P)
source utils/_load

source setup/main.sh

main "$@"

unset DOTFILES_ROOT
