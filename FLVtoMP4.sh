#!/bin/bash

# Check if the input file exists
if [ ! -f "$1" ]; then
  echo "Error: the input file does not exist"
  exit 1
fi

# Check if the input file has the .flv extension
if [ "${1##*.}" != "flv" ]; then
  echo "Error: the input file is not a .flv file"
  exit 1
fi

# Set the output file name to be the same as the input file, with the .mp4 extension
output_file_path="${1%.*}.mp4"
output_file="${output_file_path##*/}"

# Use ffmpeg to convert the .flv file to .mp4
ffmpeg -i "$1" -c copy "$output_file"

# Check if the conversion was successful
if [ $? -ne 0 ]; then
  echo "Error: the conversion failed"
  exit 1
fi

echo "Success: the file was converted to $output_file"

