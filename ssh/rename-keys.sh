# Move the new key to the .ssh directory
mv /path/to/new_key ~/.ssh/new_key

# Change the permissions of the new key
chmod 600 ~/.ssh/new_key

# Add the new key to the SSH agent
ssh-add ~/.ssh/new_key

# Remove the old key from the SSH agent
ssh-add -d ~/.ssh/old_key
