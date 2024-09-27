#!/bin/bash
# Enable software updates

softwareupdate --schedule on

# Rename the mac
sudo scutil --set ComputerName "${macName}"
sudo scutil --set LocalHostName "${macName}"
sudo scutil --set HostName "${macName}"
dscacheutil -flushcache

sleep 5

sudo /usr/local/bin/dockutil --add '/Applications/RingCentral.app' --no-restart --allhomes
sudo /usr/local/bin/dockutil --add '/Applications/Google Chrome.app' --no-restart --allhomes
sudo /usr/local/bin/dockutil --remove 'Mail' --no-restart --allhomes

sudo killall -KILL Dock

sleep 5

# Quit
exit 0
