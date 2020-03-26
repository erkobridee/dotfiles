# https://github.com/Homebrew
# https://github.com/Homebrew/brew
# https://github.com/Homebrew/homebrew-cask

setup_chapter "Homebrew"

if is_executable brew; then
	print_success 'Homebrew is already setup'
	print_info 'Updating Homebrew\n'
	setup_run brew update
	print_success 'Homebrew updated'
else
	print_installing "Homebrew"
	setup_run sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	print_installed "Homebrew"
fi
