function chmodx() {
	local TARGET=$1
	local MATCHES=$2
	if [[ -n "$TARGET" ]]; then
		# apply chmod +x to non executable files
		if [[ -d "$TARGET" ]]; then
			if [[ -n "$MATCHES" ]]; then
				find "$TARGET" -type f -not -perm +111 -iname "$MATCHES" -exec chmod +x {} \;
			else
				find "$TARGET" -type f -not -perm +111 -exec chmod +x {} \;
			fi
		elif [[ -f "$TARGET" ]]; then
			chmod +x "$TARGET"
		fi
	fi
}
