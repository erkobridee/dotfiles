setup_headline "                                                 "
setup_headline "               Setup your  Mac!                 "
setup_headline "                                                 "

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

if ! is_admin; then
	print_question 'some executions needs the sudo access'
	sudo -v
else
	setup_sudo_power "                                                 "
	setup_sudo_power "        !!! Your user has SUDO powers !!!        "
	setup_sudo_power "                                                 "
fi

while true; do
	sudo -n true
	sleep 60
	kill -0 "$$" || exit
done 2>/dev/null &
