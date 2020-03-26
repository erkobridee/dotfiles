function append() {
	local APPEND="$1"
	local TARGET="$2"

	pcregrep -qM "$APPEND" "$TARGET" || echo "$APPEND" >>"$TARGET"
}
