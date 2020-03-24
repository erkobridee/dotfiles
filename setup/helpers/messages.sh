info() {
	printf "\r  [ \033[0;94mINFO\033[0m ] $1\n"
}

user() {
	printf "\r  [ \033[0;93m??\033[0m ] $1\n"
}

success() {
	printf "\r\033[2K  [ \033[0;92mOK\033[0m ] $1\n"
}

fail() {
	printf "\r\033[2K  [\033[0;91mFAIL\033[0m] $1\n"
	echo ''
	exit
}
