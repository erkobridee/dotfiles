#!/bin/sh
#
# setup flow to the dotfiles
#
set -e

DOTFILES_DIR=$(pwd -P)
source utils/_load

# make sure to be able to execute those files
chmodx "$DOTFILES_DIR/bin"

# call an sh function using string name
# eval "print_info 'hello setup.sh'"

source setup/_run

unset DOTFILES_ROOT
