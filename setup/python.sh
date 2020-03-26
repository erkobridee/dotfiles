setup_chapter "Python"

# http://sourabhbajaj.com/mac-setup/Python/

# read the python version and prevent to display the default output
python_version=$(python --version 2>&1 | tr -d '\n')
print_info "system: $python_version"

print_todo "define the python configuration flow"

# https://github.com/pyenv/pyenv

# if is_directory $HOME/.nvm; then
# 	echo "nvm is there"
# else
# 	echo "nop"
# fi

# https://github.com/pypa/pip
# http://sourabhbajaj.com/mac-setup/Python/pip.html
# if is_executable pip; then
# 	print_already_installed 'pip'
# else
# 	print_installing 'pip'
# 	curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
# 	sudo python get-pip.py --user
# 	rm get-pip.py
# 	print_installed 'pip'
# fi

# https://github.com/pypa/virtualenv
# if is_executable virtualenv; then
# 	print_already_installed 'virtualenv'
# else
# 	print_installing 'virtualenv'
# 	python -m pip install --user virtualenv
# 	python -m virtualenv --help
# 	print_installed 'virtualenv'
# fi
