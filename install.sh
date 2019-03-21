#!/bin/sh

dotfiles="$HOME/dotfiles"

lnif() {
    if [ -e "$2" ] ; then
        echo "File exists: $2"
    else
        ln -sv "$1" "$2"
    fi
}

lnif $dotfiles/bash_aliases $HOME/.bash_aliases
lnif $dotfiles/bash_profile $HOME/.bash_profile
lnif $dotfiles/gitconfig $HOME/.gitconfig
lnif $dotfiles/vimrc $HOME/.vimrc
lnif $dotfiles/xinitrc $HOME/.xinitrc
lnif $dotfiles/Xresources $HOME/.Xresources
