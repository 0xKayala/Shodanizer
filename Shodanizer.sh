#!/bin/bash

# ASCII art
echo -e "\e[91m

   _____ __              __            _                
  / ___// /_  ____  ____/ /___ _____  (_)___  ___  _____
  \__ \/ __ \/ __ \/ __  / __ `/ __ \/ /_  / / _ \/ ___/
 ___/ / / / / /_/ / /_/ / /_/ / / / / / / /_/  __/ /    
/____/_/ /_/\____/\__,_/\__,_/_/ /_/_/ /___/\___/_/  v1.0.0   
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

echo "Scan is completed"
