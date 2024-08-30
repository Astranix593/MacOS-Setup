echo "Welcome to the Installer"
BasePath="$(pwd)"

WarpURL="https://1111-releases.cloudflareclient.com/mac/latest"
ChromeURL="https://dl.google.com/chrome/mac/universal/stable/GGRO/googlechrome.dmg"

# will check if wget is installed
if ! [ -x "$(command -v wget)" ]; then
    echo 'Error: wget is not installed.' >&2
    exit 1
fi

if ! [ -x "$(command -v installer)" ]; then
    echo 'Error: installer is not installed.' >&2
    exit 1
fi

if ! [ -x "$(command -v brew)" ]; then
    echo 'Error: brew is not installed.' >&2
    exit 1
fi

WarpAppPath="/Applications/Cloudflare WARP.app"

if [ -f "$WarpAppPath" ]; then
    echo "Warp is not installed. Downloading and installing..."
    echo "Downloading Warp..."
    rm "$BasePath/warp.pkg"
    wget -O "$BasePath/warp.pkg" "$WarpURL"
    echo "Installing Warp..."
    # sudo installer -pkg "$BasePath/warp.pkg" -target /Applications

else
    echo "Warp is already installed"
fi

exit 1
echo "Downloading Chrome..."
rm "$BasePath/chrome.dmg"
wget -O "$BasePath/chrome.dmg" "$ChromeURL"

echo "Installing Chrome..."