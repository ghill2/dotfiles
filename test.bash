#!/bin/bash

extension=".bin"  # Specify the extension you want to search for
downloads_folder="$HOME/Downloads"  # Set the path to the Downloads folder

# Change to the Downloads folder
# cd "$downloads_folder" || exit 1

# Find the most recently modified file with the specified extension
#result=$(ls -lt "$extension")

# ls -lt "$downloads_folder"
wally-cli $(find "$downloads_folder" -type f -name "*$extension" -exec ls -lt {} + | awk 'NR==1{print $NF}')

# find "$downloads_folder" -type f -name "*.bin"
# echo $result
# result=$(find "$downloads_folder" -type f -name "*.bin" -exec stat -c "%Y %n" {} + |
#     sort -rn |
#     head -n 1 |
#     awk '{print $2}')

# echo "The most recently modified file with the extension $extension is: $result"