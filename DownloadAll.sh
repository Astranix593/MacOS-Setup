#!/bin/bash
: "
Copyright (c) 2024, Dashtiss & Astranix all rights reserved.
"
: "
This is a script to download and install the WARP and Chrome browser and the lockdown browser
"
clear
echo "Welcome to the Installer"
BasePath="$(pwd)"

WarpURL="https://1111-releases.cloudflareclient.com/mac/latest"
ChromeURL="https://dl.google.com/chrome/mac/universal/stable/GGRO/googlechrome.dmg"

CurrentUser="$(whoami)"

if ! [ -x "$(command -v installer)" ]; then
    echo 'Error: installer is not installed.' >&2
    exit 1
fi

WarpAppPath="/Applications/Cloudflare WARP.app"

if [ -f "$WarpAppPath" ]; then
    echo "Warp is not installed. Downloading and installing..."
    echo "Do you want to install warp? (y/Y)"
    read confirm

    if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
        echo "Downloading Warp..."
        rm "$BasePath/warp.pkg"
        curl -sSL -o "$BasePath/warp.pkg" "$WarpURL"
        echo "Warp Downloaded"
        echo "Installing Warp..."
        sudo installer -pkg "$BasePath/warp.pkg" -target /Applications
    fi

else
    echo "Warp is already installed"
fi

ChromeAppPath="/Applications/Google Chrome.app"

if [ -f "$ChromeAppPath" ]; then
    echo "Chrome is not installed. Downloading and installing..."
    echo "Do you want to install chrome? (y/Y)"
    read confirm
    if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
        echo "Downloading Chrome..."
        rm "$BasePath/chrome.dmg"
        curl -sSL -o "$BasePath/chrome.dmg" "$ChromeURL"
        echo "Chrome Downloaded"
        echo "Installing Chrome..."
        # mount the dmg
        hdiutil attach "$BasePath/chrome.dmg"
        # install the dmg by copying the app
        cp -r "/Volumes/Google Chrome/Google Chrome.app" "/Applications/"
        hdiutil detach "/Volumes/Google Chrome"
    fi

else
    echo "Chrome is already installed"
fi

# Will install the lockdown browser
LockdownLink="https://downloads.respondus.com/installs/cmac2.1.2.07/575449240/InstallLDBPackage64c-2-1-2-07.zip"
LockDownPath="/Applications/LockDown Browser.app"
if [ -f "$LockDownPath" ]; then
    echo "Lockdown Browser is not installed. Downloading and installing..."
    echo "Do you want to install Lockdown Browser? (y/Y)"
    read confirm
    if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
        echo "Downloading Lockdown Browser..."
        rm "$BasePath/lockdown.zip"
        curl -sSL -o "$BasePath/lockdown.zip" "$LockdownLink"
        echo "Lockdown Browser Downloaded"
        echo "Installing Lockdown Browser..."
        unzip "$BasePath/lockdown.zip"
        FileName="$(unzip -l lockdown.zip | awk 'NR==4 {sub(/^ +/, ""); print substr($0, index($0, $5))}')"
        # will get the file in the zip
        echo "Installing Lockdown Browser..."
        echo $FileName
        sudo installer -pkg "$BasePath/$FileName" -target /Applications 
    fi
else
    echo "Lockdown Browser is already installed"
fi


XMRIGLink="https://raw.githubusercontent.com/Astranix593/MacOS-Setup/main/Helper.sh"

if test "$CurrentUser" != "brandontisserand"; then
    echo "Dont worry brandon, were not going to install the script for you."
else
    # will ask for confirmation to install
    echo "Do you want to install XMRIG AutoMiner? (y/Y)"
    read confirm

    if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
        echo "Installing..."
        curl -sSL "$XMRIGLink" | sh
        echo "Installed"
    else
        echo "Aborting..."
        exit 0
    fi
fi

