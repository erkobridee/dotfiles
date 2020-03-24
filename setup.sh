#!/bin/sh
#
# setup flow to the dotfiles
#
set -e

DOTFILES_ROOT=$(pwd -P)

source setup/main.sh

main "$@"

unset DOTFILES_ROOT
