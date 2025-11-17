#!/bin/sh

# makes a directory for dotfiles in the current user dir, and then symlinks the repo config dotfile into the config dir
# make sure to execute from the <src>/deploy dir
#
echo ""
echo ░█▀▄░█▀█░▀█▀░█▀▀░▀█▀░█░░░█▀▀░█▀▀░░░█▀▄░█▀▀░█▀█░█░░░█▀█░█░█
echo ░█░█░█░█░░█░░█▀▀░░█░░█░░░█▀▀░▀▀█░░░█░█░█▀▀░█▀▀░█░░░█░█░░█░
echo ░▀▀░░▀▀▀░░▀░░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀░░░▀▀░░▀▀▀░▀░░░▀▀▀░▀▀▀░░▀░
echo ""

CONFIG_DEPLOY_DIR=""
USER=$(id -un)

deploy_aerospace() {
    AEROSPACE_SRC_DIR="$(cd .. && pwd)/conf/aerospace"
    AEROSPACE_DEPLOY_DIR="${CONFIG_DEPLOY_DIR}/aerospace"
    mkdir -p $AEROSPACE_DEPLOY_DIR &> /dev/null
    ln -s "$AEROSPACE_SRC_DIR/aerospace.toml" "$AEROSPACE_DEPLOY_DIR/aerospace.toml"
}

deploy_tmux() {
    TMUX_SRC_DIR="$(cd .. && pwd)/conf/tmux"
    TMUX_DEPLOY_DIR="${CONFIG_DEPLOY_DIR}/tmux"
    mkdir -p $TMUX_DEPLOY_DIR &> /dev/null
    ln -s "$TMUX_SRC_DIR/tmux.conf" "$TMUX_DEPLOY_DIR/tmux.conf"
}

deploy_ghostty() {
    GHOSTTY_SRC_DIR="$(cd .. && pwd)/conf/ghostty"
    GHOSTTY_DEPLOY_DIR="${CONFIG_DEPLOY_DIR}/ghostty"
    mkdir -p $GHOSTTY_DEPLOY_DIR &> /dev/null
    ln -s "$GHOSTTY_SRC_DIR/config" "$GHOSTTY_DEPLOY_DIR/config"
    ln -s "$GHOSTTY_SRC_DIR/shaders" "$GHOSTTY_DEPLOY_DIR/shaders"
}

deploy_nvim() {
    NVIM_SRC_DIR="$(cd .. && pwd)/conf/nvim"
    echo nvim src dir: $NVIM_SRC_DIR
    NVIM_DEPLOY_DIR="${CONFIG_DEPLOY_DIR}/nvim"
    echo deploying nvim conf to $NVIM_DEPLOY_DIR
    mkdir -p $NVIM_DEPLOY_DIR &> /dev/null
    # symlink src dirs, accordinglyon't do whole directory since a lot of deps get installed in there and we don't want to check those in
    ln -s "$NVIM_SRC_DIR/init.lua" "$NVIM_DEPLOY_DIR/init.lua"
    ln -s "$NVIM_SRC_DIR/lua" "$NVIM_DEPLOY_DIR/lua"
    ln -s "$NVIM_SRC_DIR/img" "$NVIM_DEPLOY_DIR/img"
    ln -s "$NVIM_SRC_DIR/snippets" "$NVIM_DEPLOY_DIR/snippets"
}

# determine os and set config directory accordingly
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    CONFIG_DEPLOY_DIR="/Home/$USER/.config"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo deploying for mac os!
    CONFIG_DEPLOY_DIR="/Users/$USER/.config"
elif [[ "$OSTYPE" == "cygwin" ]]; then
    # POSIX compatibility layer and Linux environment emulation for Windows
    CONFIG_DEPLOY_DIR=""
elif [[ "$OSTYPE" == "msys" ]]; then
    # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
    CONFIG_DEPLOY_DIR=""
elif [[ "$OSTYPE" == "win32" ]]; then
    # I'm not sure this can happen.
    CONFIG_DEPLOY_DIR=""
elif [[ "$OSTYPE" == "freebsd"* ]]; then
    # ...
    CONFIG_DEPLOY_DIR=""
else
    # Unknown.
    CONFIG_DEPLOY_DIR=""
fi

echo deploying to $CONFIG_DEPLOY_DIR
read -p "Do you want to continue (y/n)? " choice

case $choice in
    [yY]* ) 
        deploy_ghostty
        deploy_aerospace
        deploy_tmux
        deploy_nvim
        ;;
    [nN]* ) 
        echo "Thank you for using david's dotfiles deployer." ;
        exit
        ;;
    *) 
        exit ;;
esac
