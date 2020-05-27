alias npmri='rm -rf node_modules && npm install'
alias yarnri='rm -rf node_modules && yarn'

alias npm_ignore_indexing='find . -type d -name "node_modules" -exec touch "{}/.metadata_never_index" \; -exec echo "✔ {}" \;'
