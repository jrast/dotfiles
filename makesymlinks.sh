#!/bin/bash
#########################
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
#########################

dir=~/dotfiles
olddir=~/dotfiles_old
files="vimrc vim"

# Create backup folder
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...Done"

# Change to the dotfiles dir
echo "Changing to the $dir directory"
cd $dir
echo "...Done"

# Move and create Symlinks
for file in $dir/*; do
    name=$(basename $file)
    if [ $name = "README.md" -o $name = "makesymlinks.sh" -o $name = ".gitmodules" -o $name = ".gitignore" ]; then
        continue
    fi
    if [ -e ~/.$name ]; then
        echo "Moving .$name from ~ to $olddir"
        mv ~/.$name $olddir/
    fi
    echo "Create symlink to $file in home directory."
    ln -s $file ~/.$name
done

