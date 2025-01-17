#!/bin/bash

# Extract the last 7 characters of the serial number
DeviceSerialNumber=$(system_profiler SPHardwareDataType | awk '/Serial/ {print substr($4, length($4)-6)}')

# Check if serial number was successfully retrieved
if [[ -z "$DeviceSerialNumber" ]]; then
  echo "Error: Unable to retrieve serial number." >&2
  exit 1
fi

# Define the naming convention
computerName="LM${DeviceSerialNumber}"

# Rename the Mac (Computer Name, Local Host Name, and Host Name)
scutil --set ComputerName "$computerName"
scutil --set LocalHostName "$computerName"
scutil --set HostName "$computerName"

# Flush the DNS cache
dscacheutil -flushcache

# Install Rosetta 2 for M1 device
arch=$(/usr/bin/arch)
 
if [ "$arch" == "arm64" ]; then
sudo /usr/sbin/softwareupdate --install-rosetta --agree-to-license
fi

# Disable software updates
softwareupdate --schedule off

# Let's not go to sleep
caffeinate -d -i -m -s -u &
caffeinatepid=$!

# Quit
exit 0
