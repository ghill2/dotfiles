#!/bin/bash

filename="./commands.py"

# Use grep to find lines containing "def <function_name>"
# Then use sed to extract just the function_name
function_names=$(grep -Eo 'def [^_][a-zA-Z0-9_]*' "$filename" | sed 's/def //')
echo $function_names

# Join function names with newline character
function_string="$(printf "%s\n" "${function_names[@]}")"

# Pipe the function string to your_program
result=$(echo -e "$function_string" | choose)
echo $result

# Run the python method
# cmd=$(printf "import commands; commands.%s()" $result)
#echo $cmd
# python -c "$cmd"

# get finder items
# https://gist.github.com/zmwangx/3fab750580d235a73ab2
# selected_items=$(osascript ./finder-selection)

# pass selected finder items to sys.agv in python
# python "./commands.py" "${selected_items[@]}"

