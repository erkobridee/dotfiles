#!/bin/sh
#
# setup flow to the dotfiles
#
set -e

DOTFILES_DIR=$(pwd -P)
source utils/_load
source setup/_run

unset DOTFILES_ROOT
