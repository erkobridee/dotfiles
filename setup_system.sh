#!/bin/sh
#
# setup flow to the dotfiles
#
set -e

DOTFILES_DIR=$(pwd -P)
source helpers/_load

# make sure to be able to execute those files
chmodx "$DOTFILES_DIR/bin"

load_sources setup/helpers
source setup/system.sh

unset DOTFILES_ROOT
