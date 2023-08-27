# uses
# https://github.com/kcrawford/dockutil

# inspirations
# https://github.com/webpro/dotfiles/blob/master/macos/dock.sh

#!/bin/sh

dockutil --no-restart --remove all
dockutil --no-restart --add "/System/Applications/Launchpad.app"
dockutil --no-restart --add "/System/Applications/Calendar.app"
dockutil --no-restart --add "/System/Applications/Utilities/Terminal.app"
dockutil --no-restart --add "/System/Applications/System Settings.app"
dockutil --no-restart --add "/Applications/Google Chrome.app"
dockutil --no-restart --add "/Applications"
dockutil --no-restart --add "/Users/erkobridee/Downloads"

killall Dock
