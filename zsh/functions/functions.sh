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
