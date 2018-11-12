#!/usr/bin/bash

JACK=1
STUDIO=1

sudo dnf install vim
cp .vimrc ~/.vimrc
mkdir ~/.vim
mkdir ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir ~/.vim/pack
mkdir ~/.vim/pack/vendor
mkdir ~/.vim/pack/vendor/Spacegray
git clone git://github.com/ajh17/Spacegray.vim ~/.vim/pack/vendor/start/Spacegray

if [ $JACK -eq 1 ]; then
    sudo dnf install jack-audio-connection-kit qjackctl
fi

if [ $STUDIO -eq 1 ]; then
    ./Ardour-5.12.0-x86_64.run
fi
