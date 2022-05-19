# uses
# https://github.com/kcrawford/dockutil

# inspirations
# https://github.com/webpro/dotfiles/blob/master/macos/dock.sh

#!/bin/sh

dockutil --no-restart --remove all
dockutil --no-restart --add "/System/Applications/Calendar.app"
dockutil --no-restart --add "/System/Applications/Utilities/Terminal.app"
dockutil --no-restart --add "/System/Applications/System Preferences.app"
dockutil --no-restart --add "/Applications/Google Chrome.app"

killall Dock
