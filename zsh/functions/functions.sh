copydir(){
    print -n $PWD | wl-copy
}

copylastcommand(){
    fc -ln -1 | tr -d '\n' | wl-copy
}

myip(){
    curlie wtfismyip.com/json
}


speedtest(){
    curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -
}

copybuffer () {
    if which wl-copy &>/dev/null; then
        echo $BUFFER | wl-copy
    else
        echo "couldn't copy current line, check the functions.zsh"
    fi
}

launch-waybar(){
    CONFIG_FILES="$DOTFILES/waybar/config.jsonc $DOTFILES/waybar/style.css "
    
    #$DOTFILES/waybar/config2.jsonc
    
    trap "killall waybar" EXIT
    
    while true; do
        waybar &
        inotifywait -e create,modify $CONFIG_FILES
        killall waybar
    done
}

