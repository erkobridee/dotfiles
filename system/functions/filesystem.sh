#------------------------------------------------------------------------------#

function mk() {
	mkdir -p "$@" && cd "$@"
}

#------------------------------------------------------------------------------#

# Usage: smartextract <file>
# Description: extracts archived files / mounts disk images
# Note: .dmg/hdiutil is Mac OS X-specific.
function smartextract() {
	if [ -f $1 ]; then
		case $1 in
		*.tar.bz2) tar -jxvf $1 ;;
		*.tar.gz) tar -zxvf $1 ;;
		*.bz2) bunzip2 $1 ;;
		*.dmg) hdiutil mount $1 ;;
		*.gz) gunzip $1 ;;
		*.tar) tar -xvf $1 ;;
		*.tbz2) tar -jxvf $1 ;;
		*.tgz) tar -zxvf $1 ;;
		*.zip) unzip $1 ;;
		*.Z) uncompress $1 ;;
		'') echo "Usage: smartextract <file>" ;;
		*) echo "'$1' cannot be extracted/mounted via smartextract()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

#------------------------------------------------------------------------------#
