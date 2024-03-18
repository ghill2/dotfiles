truncate -s 0 "/Users/g1/BU/projects/dotfiles/menu_items/main.txt"
for var in "$@"
do
    echo "$var" >> "/Users/g1/BU/projects/dotfiles/menu_items/main.txt"
done