# https://github.com/Homebrew
# https://github.com/Homebrew/brew
# https://github.com/Homebrew/homebrew-cask

setup_chapter "brew"

if is_executable brew; then
	print_success 'brew is already setup'
else
	# print_info 'setting up the brew'
	print_todo 'define the brew installation flow'
fi
