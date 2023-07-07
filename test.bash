cdpath="/path/to/directory/subdirectory/file.txt"
trimmed_path=$(echo "$cdpath" | awk -F/ '{print $(NF-3), $(NF-2), $(NF-1), $NF}' OFS="/")
echo $trimmed_path

