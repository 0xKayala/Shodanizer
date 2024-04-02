#!/bin/bash

# Rename and move Shodanizer.sh file to /usr/bin/shodanizer
sudo mv Shodanizer.sh /usr/bin/shodanizer

# Make the Shodanizer file executable
sudo chmod u+x /usr/bin/shodanizer

# Remove the Shodanizer folder from the home directory
if [ -d "$home_dir/Shodanizer" ]; then
    echo "Removing Shodanizer folder..."
    rm -r "$home_dir/Shodanizer"
fi

echo "Shodanizer has been installed successfully! Now Enter the command 'shodanizer' to run the tool."
