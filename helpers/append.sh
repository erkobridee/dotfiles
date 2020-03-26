function append() {
	if [[ $# -lt 2 ]]; then
		echo "Usage: append [string] [file]"
		return
	fi

	local APPEND="$1"
	local TARGET="$2"

	echo "$APPEND" >>"$TARGET"
}
