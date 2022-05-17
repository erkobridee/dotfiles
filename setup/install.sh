INSTALL_DIR=~/.dotfiles/setup/install

setup_chapter "install brew utilities"

setup_run brew bundle --file=$INSTALL_DIR/Brewfile || true

setup_chapter "install fonts"

setup_run brew bundle --file=$INSTALL_DIR/CaskFontsFile || true

setup_chapter "install apps"

setup_run brew bundle --file=$INSTALL_DIR/CaskAppsFile || true

setup_run xattr -d -r com.apple.quarantine ~/Library/QuickLook

setup_chapter "install VS Code cloud sync extension"

setup_run code --install-extension Shan.code-settings-sync

unset INSTALL_DIR
