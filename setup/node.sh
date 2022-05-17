setup_chapter "Node.js"

# https://github.com/nvm-sh/nvm
if is_executable nvm; then
  print_success 'nvm is already setup'
else
  print_info 'setting up the nvm'
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

  print_info 'installing the node.js v16 (lts/gallium)'
  nvm install --lts=gallium
fi

print_info "node --version $(node --version)"
print_info "npm --version $(npm --version)"
