# grep - Unix, Linux Command
# https://www.tutorialspoint.com/unix_commands/grep.htm
#
# example:
# file_contains_pattern $HOME/.zshrc ".dotfiles" && echo 'yes' || echo 'no'
function file_contains_pattern() {
	local FILE=$1
	local PATTERN=$2
	grep -q "$PATTERN" "$FILE"
	[ $? -eq 0 ]
}
