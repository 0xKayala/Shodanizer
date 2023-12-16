#!/bin/bash

# ASCII art
echo -e "\e[91m"
cat << "EOF"

   _____ __              __            _                
  / ___// /_  ____  ____/ /___ _____  (_)___  ___  _____
  \__ \/ __ \/ __ \/ __  / __ `/ __ \/ /_  / / _ \/ ___/
 ___/ / / / / /_/ / /_/ / /_/ / / / / / / /_/  __/ /    
/____/_/ /_/\____/\__,_/\__,_/_/ /_/_/ /___/\___/_/  v1.0.0   
                           Made by Satya Prakash (0xKayala)                

EOF
echo -e "\e[0m"                                                      

# Help menu
display_help() {
    echo -e "Shodanizer is a Powerful Automation tool for detecting XSS, SQLi, SSRF, Open-Redirect, etc. vulnerabilities in Web Applications\n\n"
    echo -e "Usage: $0 [options]\n\n"
    echo "Options:"
    echo "  -h, --help              Display help information"
    echo "  -d, --domain <domain>   Domain to scan with Shodan"
    echo "  -i, --ip <ip address>   IP Address to scan with Shodan"
    exit 0
}

# Check if Shodan is installed, if not, install it
if ! command -v shodan &> /dev/null; then
    echo "Installing Shodan..."
    pip3 install -U --user shodan
fi

# Parse command line arguments
while [[ $# -gt 0 ]]
do
    key="$1"
    case $key in
        -h|--help)
            display_help
            ;;
        -d|--domain)
            domain="$2"
            shift
            shift
            ;;
        -i|--ip)
            ip="$2"
            shift
            shift
            ;;
        *)
            echo "Unknown option: $key"
            display_help
            ;;
    esac
done

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

echo "Shodan Scan is completed"
