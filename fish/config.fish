# Prompt
function fish_prompt
    set_color green
    echo -n 'nomad '
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
# Utils
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias l='ls'
alias lla='ls -la'

alias c='clear'
alias cl='clear && hello_message'

# Config editing
alias reload='source ~/.config/fish/config.fish'
alias hxrc='vim ~/.config/fish/config.fish'

alias hc='rm -rf ~/.local/share/fish/fish_history'

alias cool='cl && neofetch && echo "" && wtlite'

alias nomados='cd ~/Code/NomadOS/build && qemu-system-i386 -drive file=os.img,format=raw,if=floppy -display curses'

alias startpicom='picom &; ps | grep picom | disown'
alias killpicom='pkill -u nomad -x picom'

alias nvimfzf='nvim $(fzf)'

# Quick cd
alias cdn='cd ~/Notes'
