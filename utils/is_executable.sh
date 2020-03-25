function is_executable() {
	if type "$1" >/dev/null 2>&1; then
		exit 0
	else
		exit 1
	fi
}
