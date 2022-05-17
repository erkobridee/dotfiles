setup_chapter "Node.js NVM"

# https://github.com/nvm-sh/nvm
if is_directory ~/.nvm; then
  print_success 'nvm is already setup'
else
  print_info 'setting up the nvm'
  setup_run curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
fi
