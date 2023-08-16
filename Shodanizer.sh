#!/bin/bash

# ASCII art
echo -e "\e[91m

   _____ _               _             _              
  / ____| |             | |           (_)             
 | (___ | |__   ___   __| | __ _ _ __  _ _______ _ __ 
  \___ \| '_ \ / _ \ / _` |/ _` | '_ \| |_  / _ \ '__|
  ____) | | | | (_) | (_| | (_| | | | | |/ /  __/ |   
 |_____/|_| |_|\___/ \__,_|\__,_|_| |_|_/___\___|_|   
                    Made by Satya Prakash (0xKayala)                
\e[0m"                                                      

echo "Enter the target IP or domain:"
read target

# Check if the target is an IP address or Domain
if [[ $target =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "Scanning IP: $target"
    shodan host "$target"
else
    echo "Scanning domain: $target"
    shodan domain "$target"
fi

echo "Scan completed."
