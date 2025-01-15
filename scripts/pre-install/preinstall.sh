#!/bin/bash
# Disable software updates
# softwareupdate --schedule off

sleep 5


arch=$(/usr/bin/arch)
 
if [ "$arch" == "arm64" ]; then
sudo /usr/sbin/softwareupdate --install-rosetta --agree-to-license
fi


# Rename the mac
serial_number=$(ioreg -l | awk '/IOPlatformSerialNumber/ {print $4}' | tr -d '"')
macName="LM${serial_number:3}"
# echo "Serial Number: $macName"


sudo scutil --set ComputerName "${macName}"
sudo scutil --set LocalHostName "${macName}"
sudo scutil --set HostName "${macName}"
dscacheutil -flushcache

sleep 5



# Quit
exit 0