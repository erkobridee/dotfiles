# Parameter expansion
# https://wiki.bash-hackers.org/syntax/pe

# Bash tips: Colors and formatting (ANSI/VT100 Control sequences)
# https://misc.flogisoft.com/bash/tip_colors_and_formatting

# Find Length of String in Bash – Linux Hint
# https://linuxhint.com/length_of_string_bash/

# Linux / UNIX: Bash Script Sleep or Delay a Specified Amount of Time
# https://www.cyberciti.biz/faq/linux-unix-sleep-bash-scripting/

#------------------------------------------------------------------------------#

function print_set_vars() {
	count=1

	reset="\033[0m"

	sudo_power="\033[0;44;97m"
	headline="\033[0;104;97m"
	chapter="\033[0;100;97m"

	dot="\033[0;33m▸ $reset"

	dim="\033[2m"
	bold="\033[1m"
}

function print_unset_vars() {
	unset count reset headline chapter dot dim bold
}

#------------------------------------------------------------------------------#

function repeat_char() {
	local char=${1:=" "}
	local LEN=${2:-1}
	echo "$(for i in {1..$LEN}; do printf "%s" "$char"; done)"
}

#------------------------------------------------------------------------------#

function setup_sudo_power() {
	echo "${sudo_power}$@${reset}"
}

function setup_headline() {
	echo "${headline}$@${reset}"
}

function setup_chapter() {
	echo ''
	echo "${chapter} $((count++)).) $@  ${reset}"
	echo ''
}

# Prints out a step, if last parameter is true then without an ending newline
function setup_step() {
	if [ $# -eq 1 ]; then
		echo "${dot}$@"
	fi
}

function setup_run() {
	echo "${dim}▸ $@ ${reset}"
	eval $@
	echo ''
}

#------------------------------------------------------------------------------#

function print_hr() {
	local LEN=${1:-70}
	echo
	echo "> $(repeat_char '-' $LEN) <"
	echo
}

function print_info() {
	printf "\r  [ 🧩 \033[0;94mINFO\033[0m ] $1\n"
}

function print_question() {
	printf "\r  [ \033[0;93m???\033[0m ✏️ ] $1\n"
}

function print_warning() {
	printf "\r  [ ⚠️ \033[0;93mWARNING\033[0m ] $1\n"
}

function print_todo() {
	printf "\r  [ 📝 \033[0;33mTODO\033[0m ] $1\n"
}

function print_success() {
	printf "\r\033[2K  [ ✅ \033[0;92mOK\033[0m ] $1\n"
}

function print_done() {
	echo
	echo "> $(printf '%.0s-' {1..70}) <"
	echo
	printf "\r\033[2K  [ 🏁 \033[0;92mDONE\033[0m ] $1 \n"
	echo
}

function print_fail() {
	print_hr
	printf "\r\033[2K  [ 🛑 \033[0;91mFAIL\033[0m ] $1\n"
	echo

	# bail
	if [ -n "$2" ]; then
		sleep 5
		exit 1
	fi
}

#------------------------------------------------------------------------------#

function print_already_installed() {
	print_success "$1 already installed. Skipping."
}

function print_installing() {
	print_info "Installing $1..."
}

function print_installed() {
	print_success "$1 installed."
}
