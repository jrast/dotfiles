# Dotfiles
Vim and Bash config files

## Installation
```bash
git clone git://github.com/jrast/dotfiles.git /home/<user>/dotfiles
chmod +x /home/<user>/dotfiles/makesymlinks.sh
/home/<user>/dotfiles/makesymlinks.sh
```

If you run this script as sudo (for example during vagrant up/provision) you can pass an aditional
parameter `-u` to specifie for which user you wan't to run the script:
```bash
/bin/bash /home/vagrant/dotfiles/makesymlinks.sh -u vagrant
```
