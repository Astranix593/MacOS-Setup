#!/bin/bash
path=$(pwd)
mkdir -p $HOME/Documents/TEMP
sudo echo ""
for file in "$path"/*; do
    # will check if the file ends with .dmg
    if [[ $file == *.dmg ]]; then
        echo "Installing $file"
        # will install the file
        # will get the name of the volume
        mkdir -p "$HOME"/Documents/TEMP/"$(basename "$file" .dmg)"
        hdiutil attach "$file" -mountpoint "$HOME"/Documents/TEMP/"$(basename "$file" .dmg)" -quiet

        for File in "$HOME/Documents/TEMP/$(basename "$file" .dmg)"/*; do
            if [[ $File == *.app ]]; then
                
                FileName=$(basename "$File")
                echo "File Name: $File"
                echo "Installing $$FileName"
                if ! [ -d "/Applications/$FileName" ]; then
                    sudo cp -r "$File" "/Applications/" 
                    echo "Installed"
                    break
                    
                else
                    echo "Already installed"
                    break
                fi
            fi
        done
        # will get the name of the app
        exit
    fi
done
rm -rf $HOME/Documents/TEMP