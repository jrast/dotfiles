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
    basename=$(basename $file)
    if [ $basename = "README.md" -o $basename = "makesymlinks.sh" ]; then
        continue
    fi
    if [ -e ~/.$basename ]; then
        echo "Moving .$basename from ~ to $olddir"
        mv ~/.$basename $olddir/
    fi
    echo "Create symlink to $file in home directory."
    ln -s $file ~/.$basename
done

