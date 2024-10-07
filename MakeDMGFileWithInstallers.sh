#! /bin/bash
# will download all the links then save the folder to a dmg file
# will gain sudo access

sudo echo ""

WarpURL="https://1111-releases.cloudflareclient.com/mac/latest"


ChromeURL="https://dl.google.com/chrome/mac/universal/stable/GGRO/googlechrome.dmg"


LockdownLink="https://downloads.respondus.com/installs/cmac2.1.2.07/575449240/InstallLDBPackage64c-2-1-2-07.zip"

 
StarTestingUrl="https://sb.portal.cambiumast.com/geturls?clientName=texas&operatingSystem=macOS"


OEMLockdown="https://downloads.respondus.com/OEM/InstallLDBOEM.zip"

NWEALockdown="https://cdn.nwea.org/docs/NWEA-Secure-Testing-Browser-Mac.dmg"

BasePath="$(pwd)"
# will download them all

rm -rf "$BasePath/AllDownloads"
mkdir "$BasePath/AllDownloads"
rm "$BasePath/AllDownloads.dmg"
# will download them all
echo "Downloading all files"
if true ; then
    echo "Downloading Warp"
    curl -sSL -o "$BasePath/AllDownloads/Warp.dmg" "$WarpURL"
    echo "Downloading Chrome"
    curl -sSL -o "$BasePath/AllDownloads/Chrome.dmg" "$ChromeURL"
    echo "Downloading Lockdown"
    curl -sSL -o "$BasePath/AllDownloads/Lockdown.zip" "$LockdownLink"
    echo "Downloading StarTesting"
    curl -sSL -o "$BasePath/AllDownloads/StarTesting.zip" "$StarTestingUrl"
    echo "Downloading OEM Lockdown"
    curl -sSL -o "$BasePath/AllDownloads/OEMLockdown.zip" "$OEMLockdown"
    echo "Downloading NWEA Lockdown"
    curl -sSL -o "$BasePath/AllDownloads/NWEALockdown.dmg" "$NWEALockdown"
fi

echo "Done Downloading"

# will then make the dmg file
size=$(du -sh "$BasePath/AllDownloads" | awk '{print $1}')

echo "Creating DMG file"
echo "Size: $size"

#  Usage:  hdiutil create <sizespec> [options] <imagepath>
hdiutil create -srcfolder "$BasePath/AllDownloads" -volname "AllDownloads" -fs HFS+ -fsargs "-c c=64,a=16,e=16" -format UDRW -size "$size" "$BasePath/AllDownloads.dmg"

echo "Done"

