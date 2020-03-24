# utility to load add files from a given place
function load_source() {
	local DIR=$1
	local MATCHES=$2
	MATCHES=${MATCHES:='*.sh'}
	for FILE in $(find "$DIR" -iname "$MATCHES" | sort); do
		[ -f $FILE ] && . $FILE
	done
}
