#!/bin/bash

# Define an array of files to create symbolic links for
files=(".vimrc" ".aliases" ".jojoquotes" ".tmux.conf" ".zshrc")

# Loop through each file and create symbolic links
for file in "${files[@]}"; do
    source_file="$HOME/dotfiles/$file"
    dest_file="$HOME/$file"

    # Check if the source file exists
    if [ -f "$source_file" ]; then
        # Check if the destination file already exists
        if [ ! -e "$dest_file" ]; then
            # Create the symbolic link
            ln -s "$source_file" "$dest_file" && \
            echo "Symbolic link created: $dest_file -> $source_file" || \
            echo "Error: Failed to create symbolic link."
        else
            echo "Error: $dest_file already exists."
        fi
    else
        echo "Error: $source_file does not exist."
    fi
done

# Create symbolic link for molokai.vim
molokai_source="$HOME/dotfiles/molokai.vim"
molokai_dest="$HOME/.vim/colors/molokai.vim"

# Check if the source file exists
if [ -f "$molokai_source" ]; then
    # Check if the destination directory exists, if not, create it
    if [ ! -d "$(dirname "$molokai_dest")" ]; then
        mkdir -p "$(dirname "$molokai_dest")"
    fi

    # Check if the destination file already exists
    if [ ! -e "$molokai_dest" ]; then
        # Create the symbolic link
        ln -s "$molokai_source" "$molokai_dest" && \
        echo "Symbolic link created: $molokai_dest -> $molokai_source" || \
        echo "Error: Failed to create symbolic link."
    else
        echo "Error: $molokai_dest already exists."
    fi
else
    echo "Error: $molokai_source does not exist."
fi
