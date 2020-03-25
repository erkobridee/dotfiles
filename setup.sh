#!/bin/sh
#
# setup flow to the dotfiles
#
set -e

DOTFILES_DIR=$(pwd -P)
source utils/_load

# call an sh function using string name
# eval "print_info 'hello'"

source setup/_run

unset DOTFILES_ROOT
