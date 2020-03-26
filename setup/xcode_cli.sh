setup_chapter "xcode CLI tools"

if ! command_exists cc; then
	print_installing "xcode CLI tools"
	xcode-select --install
	print_installed "xcode CLI tools"
else
	print_already_installed "xcode CLI tools"
fi
