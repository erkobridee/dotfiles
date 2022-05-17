MACOS_DIR=~/.dotfiles/setup/macos

source $MACOS_DIR/default.sh
print_done "setup macOS applying defaults"

source $MACOS_DIR/default-chrome.sh
print_done "setup macOS Google Chrome"

unset MACOS_DIR
