#!/bin/sh
# Will compile the DownloadAll.sh script
URL="https://github.com/Astranix593/MacOS-Setup/raw/main/DownloadAll.sh"
echo "Compiling DownloadAll.sh"
rm -r Build
mkdir Build

# shc Usage: shc [-e date] [-m addr] [-i iopt] [-x cmnd] [-l lopt] [-o outfile] [-rvDSUHCABh] -f script
shc -m $URL -f DownloadAll.sh -o Build/DownloadAll

sudo codesign -f -s -v Build/DownloadAll