#!/bin/bash

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
