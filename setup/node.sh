setup_chapter "Node.js"

if is_executable nvm; then
	print_success 'nvm is already setup'
else
	# print_info 'setting up the nvm'
	print_todo "define the installation of nvm flow"
fi

print_info "node --version $(node --version)"
print_info "npm --version $(npm --version)"
