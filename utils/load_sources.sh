function load_source() {
	[ -f $1 ] && . $1
}

# utility to load add files from a given place
function load_sources() {
	local DIR=$1
	local MATCHES=$2
	MATCHES=${MATCHES:='*.sh'}
	for FILE in $(find "$DIR" -iname "$MATCHES" | sort); do
		load_source $FILE
	done
}
