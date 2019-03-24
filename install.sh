#!/bin/sh

dotfiles="$HOME/dotfiles"

lnif() {
    if [ -e "$2" ]; then
        echo "File exists: $2"
        return 1
    else
        ln -sv "$1" "$2"
        return 0
    fi
}

if [ ! -d "$HOME/.bash.d" ]; then
    mkdir $HOME/.bash.d
fi

bashd_lnif() {
    lnif $dotfiles/bash.d/$1 $HOME/.bash.d/$1 &&
        echo "[ -f ~/.bash.d/$1 ] && source ~/.bash.d/$1" >> ~/.bashrc
}

bashd_lnif aliases.bash
bashd_lnif fzf.bash
bashd_lnif prompt.bash

lnif $dotfiles/bash_profile $HOME/.bash_profile
lnif $dotfiles/gitconfig $HOME/.gitconfig
lnif $dotfiles/mutt $HOME/.mutt
lnif $dotfiles/procmailrc $HOME/.procmailrc
lnif $dotfiles/vimrc $HOME/.vimrc
lnif $dotfiles/xinitrc $HOME/.xinitrc
lnif $dotfiles/xmonad $HOME/.xmonad
lnif $dotfiles/Xresources $HOME/.Xresources
