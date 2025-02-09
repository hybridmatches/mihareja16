#!/bin/bash

# Get the current directory where the script is run
cd content
base_dir=$(pwd)

# Loop through each subdirectory (assuming each subdirectory is a map)
for dir in "$base_dir"/*/; do
  # Check if it is a directory
  if [ -d "$dir" ]; then
    # Extract the map name from the directory name (strip trailing slash)
    map_name=$(basename "$dir")

    # Define the .htm file path as "meta.htm"
    htm_file="$dir/meta.htm"

    # Check if the .htm file exists
    if [ -f "$htm_file" ]; then
      echo "Found $htm_file, updating it with map name: $map_name"
    else
      echo "No meta.htm file found in $dir. Creating $htm_file"
    fi

    # Create or overwrite the meta.htm file with the map name
    echo "<title>ganga95 - $map_name</title> <meta name='description' content='$map_name' />" > "$htm_file"
    echo "Updated/created $htm_file with map name: $map_name"

    

  fi
done

echo "Script completed."
