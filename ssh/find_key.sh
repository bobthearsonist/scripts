#!/bin/bash

# Get the SHA-256 fingerprint from the command line argument
fingerprint=$1

# Go to the .ssh directory
cd ~/.ssh

# Loop over all .pub files in the .ssh directory
for file in *.pub; do
    # Get the SHA-256 fingerprint of the current file
    file_fingerprint=$(ssh-keygen -lf $file -E sha256 | awk '{print $2}')

    # If the fingerprint of the current file matches the input fingerprint
    if [ "$file_fingerprint" == "$fingerprint" ]; then
        # Print the name of the file
        echo "The file with the matching fingerprint is: $file"
        exit 0
    fi
done

# If no matching file was found
echo "No file with the matching fingerprint was found."
