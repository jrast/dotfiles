#!/bin/bash
#########################
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
#########################

homedir=~

while getopts u: opt; do
    case "$opt" in
        u) homedir=/home/$OPTARG;;
    esac
done

dir=$homedir/dotfiles
olddir=$homedir/dotfiles_old

# Create backup folder
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...Done"


# Move and create Symlinks
for file in $dir/*; do
    name=$(basename $file)
    if [ $name = "README.md" -o $name = "makesymlinks.sh" -o $name = ".gitmodules" -o $name = ".gitignore" ]; then
        continue
    fi
    if [ -e $homedir/.$name ]; then
        echo "Moving .$name from ~ to $olddir"
        mv $homedir/.$name $olddir/
    fi
    echo "Create symlink to $file in home directory."
    ln -s $file $homedir/.$name
done

