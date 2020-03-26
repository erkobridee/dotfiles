echo
echo
echo "        Setup your  Mac!        "
echo

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

if ! is_admin; then
	print_user 'some executions needs the sudo access'
	sudo -v
else
	echo
	echo '        !!! Your user has SUDO powers !!!        '
	echo
	echo
fi

while true; do
	sudo -n true
	sleep 60
	kill -0 "$$" || exit
done 2>/dev/null &
