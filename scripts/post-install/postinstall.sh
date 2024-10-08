#!/bin/bash

APP_NAME="UEMS Agent" 
APP_PATH="/Library/ManageEngine/UEMS_Agent/bin/$APP_NAME.app"


TIMEOUT=300
CHECK_INTERVAL=10  
elapsed_time=0

# Checks if Application is installed or not

is_installed() {
    if [ -d "$APP_PATH" ]; then
        return 0  # App is installed
    else
        return 1  # App is not installed
    fi
}


while ! is_installed; do
    echo "$APP_NAME is not installed. Checking again in $CHECK_INTERVAL seconds..."

    sleep $CHECK_INTERVAL
    elapsed_time=$((elapsed_time + CHECK_INTERVAL))

    if [ $elapsed_time -ge $TIMEOUT ]; then
        echo "Timeout of 5 minutes reached. $APP_NAME is not installed."
        exit 1
    fi
done

echo "$APP_NAME is installed."



# Updating ManageEngine to install apps

cd /Library/ManageEngine/UEMS_Agent/bin && sudo ./cfgupdate


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
