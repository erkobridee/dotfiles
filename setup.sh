#!/bin/sh
#
# setup flow to the dotfiles
#
set -e

DOTFILES_DIR=$(pwd -P)
source helpers/_load

# make sure to be able to execute those files
chmodx "$DOTFILES_DIR/bin"

source setup/_run

unset DOTFILES_ROOT
