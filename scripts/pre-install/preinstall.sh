#!/bin/bash
# Disable software updates
softwareupdate --schedule off

sleep 5


arch=$(/usr/bin/arch)
 
if [ "$arch" == "arm64" ]; then
sudo /usr/sbin/softwareupdate --install-rosetta --agree-to-license
fi




# Quit
exit 0