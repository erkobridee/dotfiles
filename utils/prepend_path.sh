function prepend_path() {
	[ -d $1 ] && PATH="$1:$PATH"
}
