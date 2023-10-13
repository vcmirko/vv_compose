#!/bin/bash

# Define temporary directory
tmp_dir="/tmp"

# Clone the repository
git clone https://github.com/vcmirko/vv_compose.git "$tmp_dir/vv_compose"

# Check if the clone was successful
if [ $? -eq 0 ]; then
    echo "Repository cloned successfully."

    # Define source and target directories
    src_dir="$tmp_dir/vv_compose/data/playbooks"
    target_dir="/srv/apps/vv_compose/data"

    # Check if the source directory exists
    if [ -d "$src_dir" ]; then
        # Remove the target directory if it already exists
        if [ -d "$target_dir/playbooks" ]; then
            echo "Removing existing target directory: $target_dir"
            rm -rf "$target_dir/playbooks"
        fi

        # Move the source directory to the target location
        mv "$src_dir" "$target_dir"
        echo "Moved $src_dir to $target_dir"
    else
        echo "Source directory $src_dir not found."
    fi
else
    echo "Failed to clone the repository."
fi

# Clean up the temporary directory
rm -rf "$tmp_dir/vv_compose"

echo "Temporary directory cleaned up."
