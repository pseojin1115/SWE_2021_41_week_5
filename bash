#!/bin/bash

file_path="files"

for element in "$file_path"/*; do
    if [ -f "$element" ]; then
        first_char=$(basename "$element" | cut -c1)

        if [[ "$first_char" =~ [[:upper:]] ]]; then
            first_char=$(echo "$first_char" | tr '[:upper:]' '[:lower:]')
        fi

        target_file="$first_char"
        parent_directory=$(dirname "$file_path")

        if [ -e "$parent_directory/$target_file" ]; then
            mv "$element" "$parent_directory/$target_file"
    fi
done
