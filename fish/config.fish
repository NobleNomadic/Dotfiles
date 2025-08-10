# Prompt
function fish_prompt
    set_color green
    echo -n 'kiwi '
    set_color red
    echo -n '['(prompt_pwd)']'
    set_color green
    echo -n '> '
    set_color normal
end

# Disable start message
function fish_greeting
    set_color blue
    echo -n "[*] "
    set_color normal
    echo "Terminal Ready "(date '+%H:%M')""
end

# Start message function for other calling
function hello_message
    set_color blue
    echo -n "[*] "
    set_color normal
    echo "Terminal Ready "(date '+%H:%M')""
end

# Aliases
# Helix
alias helix='/home/nomad/AppImages/helix.AppImage'
alias hxrc='/home/nomad/AppImages/helix.AppImage ~/.config/fish/config.fish'

# WtLite
alias wtlite='python3 /home/nomad/Code/WtLite/wtlite.py Adelaide -temp -rain -wind'

# Utils
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias l='ls'

alias disk='df -h | grep root'

alias c='clear'
alias cl='clear && hello_message'

alias reload='source ~/.config/fish/config.fish'

alias neofetch='neofetch --ascii_colors 7 --colors 1 1 7 1 8 7 '

alias hc='rm -rf ~/.local/share/fish/fish_history'

alias cool='cl && neofetch && echo "" && wtlite'

alias nomados='cd ~/Code/NomadOS/build && qemu-system-i386 -drive file=os.img,format=raw,if=floppy -display curses'

alias startpicom='picom &; ps | grep picom | disown'
alias killpicom='pkill -u nomad -x picom'

# Quick cd
alias cdn='cd ~/Notes'
