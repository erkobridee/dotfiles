if ! command_exists cc; then
	print_info "Installing xcode CLI tools..."
	xcode-select --install
	print_success "Xcode CLI tools installed."
else
	print_success "Xcode already installed. Skipping."
fi
