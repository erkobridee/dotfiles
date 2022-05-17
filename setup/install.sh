INSTALL_DIR=$DOTFILES_DIR/$(dirname $BASH_SOURCE)/install

setup_chapter "install brew utilities"

brew bundle --file=$(INSTALL_DIR)/Brewfile || true

setup_chapter "install fonts"

brew bundle --file=$(INSTALL_DIR)/CaskFontsFile || true

setup_chapter "install apps"

brew bundle --file=$(INSTALL_DIR)/CaskAppsFile || true

xattr -d -r com.apple.quarantine ~/Library/QuickLook

setup_chapter "install VS Code cloud sync extension"

code --install-extension Shan.code-settings-sync

unset INSTALL_DIR
