# Dotfiles
My configuration for dwm, dmenu, fish, and my setup for quickly switching themes for alacritty,

## Suckless Programs
Compile either dwm or dmenu by moving to the folder in a terminal, and running
```bash
sudo make clean install
```

## Fish, Picom, xinitrc
Simply put the configuration files in this repo into their locations in the .config folder to use them.
Put xinitrc in your home folder as `~/.xinitrc`

## QuickThemes
The bash script [switchTheme.sh](quickthemes/switchTheme.sh) will use the folder `~/.quickthemes` to automatically set your wallpaper, helix configuration, and alacritty config.
To make a new theme, make a new folder in the the themes folder, then create 3 files with these names:
- helix.toml
- wallpaper.jpg
- alacritty.yml
Note that even if you have a .jpeg or .png file for a wallpaper, you still need to change the extension to jpg.
On Linux, changing the file extension won't corrupt the data or modify it.
The folder name of the theme will not effect the program.

Now, whenever the script is run, the script will use the 3 files in the next theme folder to set your wallpaper, alacritty config and helix config.
