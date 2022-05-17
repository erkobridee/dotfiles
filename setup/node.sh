setup_chapter "Node.js"

# https://github.com/nvm-sh/nvm
if is_executable nvm; then
  print_info 'installing the node.js v16 (lts/gallium)'
  setup_run nvm install --lts=gallium

  print_info "node --version $(node --version)"
  print_info "npm --version $(npm --version)"
fi
