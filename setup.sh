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

function case_nodejs() {
  source setup/node.sh
  print_done "setup node.js"
}

function case_macos_dock() {
  source setup/macos/dock.sh
  print_done "setup macOS dock"
}

function case_macos_default() {
  source setup/macos/default.sh
  print_done "setup macOS applying defaults"
}

function case_macos_ask() {
  source setup/macos/ask.sh
  print_done "setup macOS asking"
}

function case_macos_google_chrome() {
  source source setup/macos/default-chrome.sh
  print_done "setup macOS Google Chrome"
}

function case_macos_apps() {
  source source setup/macos/install.sh
  print_done "setup macOS Apps and Fonts"

  case_macos_google_chrome
}

function case_macos() {
  print_set_vars
  source setup/prepare.sh
  case "$SUB_COMMAND" in
  ask)
    case_macos_ask
    ;;
  *)
    case_macos_default
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
nodejs)
  case_nodejs
  ;;
macos_dock)
  case_macos_dock
  ;;
macos_apps)
  case_macos_apps
  ;;
macos)
  case_macos
  ;;
*)
  case_default
  ;;
esac

unset DOTFILES_ROOT COMMAND SUB_COMMAND
