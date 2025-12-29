#!/bin/sh

# makes a directory for dotfiles in the current user dir, and then symlinks the repo config dotfile into the config dir
# make sure to execute from the <src>/deploy dir so the correct src dir gets picked up.
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
    rm -rf $AEROSPACE_DEPLOY_DIR
    mkdir -p $AEROSPACE_DEPLOY_DIR &> /dev/null
    ln -s "$AEROSPACE_SRC_DIR/aerospace.toml" "$AEROSPACE_DEPLOY_DIR/aerospace.toml"
}

deploy_sway() {
    SWAY_SRC_DIR="$(cd .. && pwd)/conf/sway"
    SWAY_DEPLOY_DIR="${CONFIG_DEPLOY_DIR}/sway"
    rm -rf $SWAY_DEPLOY_DIR
    mkdir -p $SWAY_DEPLOY_DIR &> /dev/null
    ln -s "$SWAY_SRC_DIR/img" "$SWAY_DEPLOY_DIR/img"
    ln -s "$SWAY_SRC_DIR/config" "$SWAY_DEPLOY_DIR/config"
}

deploy_rofi() {
    ROFI_SRC_DIR="$(cd .. && pwd)/conf/rofi"
    ROFI_DEPLOY_DIR="${CONFIG_DEPLOY_DIR}/rofi"
    rm -rf $ROFI_DEPLOY_DIR
    mkdir -p $ROFI_DEPLOY_DIR &> /dev/null
    ln -s "$ROFI_SRC_DIR/config.rasi" "$ROFI_DEPLOY_DIR/config.rasi"
}

deploy_tmux() {
    TMUX_SRC_DIR="$(cd .. && pwd)/conf/tmux"
    TMUX_DEPLOY_DIR="${CONFIG_DEPLOY_DIR}/tmux"
    rm -rf $TMUX_DEPLOY_DIR
    rm -rf ~/.tmux/plugins/tpm
    mkdir -p $TMUX_DEPLOY_DIR &> /dev/null
    ln -s "$TMUX_SRC_DIR/tmux.conf" "$TMUX_DEPLOY_DIR/tmux.conf"
    # install tpm
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    echo Tmux Plugin Manager Installed. Install plugins with \'CTRL\+A\-\>I\' the next time tmux is launched. 
}

deploy_ghostty() {
    GHOSTTY_SRC_DIR="$(cd .. && pwd)/conf/ghostty"
    GHOSTTY_DEPLOY_DIR="${CONFIG_DEPLOY_DIR}/ghostty"
    rm -rf $GHOSTTY_DEPLOY_DIR
    mkdir -p $GHOSTTY_DEPLOY_DIR &> /dev/null
    ln -s "$GHOSTTY_SRC_DIR/config" "$GHOSTTY_DEPLOY_DIR/config"
    ln -s "$GHOSTTY_SRC_DIR/shaders" "$GHOSTTY_DEPLOY_DIR/shaders"
}

deploy_nvim() {
    NVIM_SRC_DIR="$(cd .. && pwd)/conf/nvim"
    echo nvim src dir: $NVIM_SRC_DIR
    NVIM_DEPLOY_DIR="${CONFIG_DEPLOY_DIR}/nvim"
    echo deploying nvim conf to $NVIM_DEPLOY_DIR
    rm -rf $NVIM_DEPLOY_DIR
    mkdir -p $NVIM_DEPLOY_DIR &> /dev/null
    # symlink src dirs, accordinglyon't do whole directory since a lot of deps get installed in there and we don't want to check those in
    ln -s "$NVIM_SRC_DIR/init.lua" "$NVIM_DEPLOY_DIR/init.lua"
    ln -s "$NVIM_SRC_DIR/lua" "$NVIM_DEPLOY_DIR/lua"
    ln -s "$NVIM_SRC_DIR/img" "$NVIM_DEPLOY_DIR/img"
    ln -s "$NVIM_SRC_DIR/snippets" "$NVIM_DEPLOY_DIR/snippets"
    ln -s "$NVIM_SRC_DIR/ftplugin" "$NVIM_DEPLOY_DIR/ftplugin"
}

CONFIG_DEPLOY_DIR="$HOME/.config"
echo "This script is destructive. Folders in $CONFIG_DEPLOY_DIR may be permanently DESTROYED."
read -p "Are you sure you want to continue (Y/N)? " choice

case $choice in
    [yY]* ) 
        # determine os and deploy appropriate dot files
        if [[ "$OSTYPE" == "linux-gnu"* ]]; then
            echo deploying for linux!
            deploy_ghostty
            deploy_tmux
            deploy_nvim
            deploy_sway
            deploy_rofi
        elif [[ "$OSTYPE" == "darwin"* ]]; then
            echo deploying for mac os!
            deploy_ghostty
            deploy_aerospace
            deploy_tmux
            deploy_nvim
            echo done deploying for mac os.
        elif [[ "$OSTYPE" == "cygwin" ]]; then
            # POSIX compatibility layer and Linux environment emulation for Windows
            echo deploying for cygwin!
        elif [[ "$OSTYPE" == "msys" ]]; then
            # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
            echo deploying for windows!
        elif [[ "$OSTYPE" == "win32" ]]; then
            # I'm not sure this can happen.
            echo deploying for lol!
        elif [[ "$OSTYPE" == "freebsd"* ]]; then
            echo deploying for freebsd!
        else
            # Unknown.
            echo deploying for unknown!
        fi
        ;;
    [nN]* ) 
        echo "Thank you for using david's dotfiles deployer." ;
        exit
        ;;
    *) 
        exit ;;
esac
echo "Dotfiles deployed. Thanks for using david's dotfiles deployer. " ;

