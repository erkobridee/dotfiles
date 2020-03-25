alias functions="declare -f | grep '^[a-z].* ()' | sed 's/{$//'"
alias paths='echo -e ${PATH//:/\\n}'
