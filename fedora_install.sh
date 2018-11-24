#!/usr/bin/bash

PACKAGE="all"

if [ $PACKAGE = "all" ]; then
    VIM=1
    JACK=1
    STUDIO=1
    STEAM=1
    NETWORK=1
elif [ $PACKAGE = "fun" ]; then
    STEAM=1
elif [ $PACKAGE = "prog" ]; then
    VIM=1
elif [ $PACKAGE = "music" ]; then
    JACK=1
    STUDIO=1
fi

if [[ $VIM -eq 1 ]]; then
    sudo dnf install vim
    cp .vimrc ~/.vimrc
    mkdir ~/.vim
    mkdir ~/.vim/bundle
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    mkdir ~/.vim/pack
    mkdir ~/.vim/pack/vendor
    mkdir ~/.vim/pack/vendor/Spacegray
    git clone git://github.com/ajh17/Spacegray.vim ~/.vim/pack/vendor/start/Spacegray
fi

if [[ $JACK -eq 1 ]]; then
    sudo dnf install jack-audio-connection-kit qjackctl
    sudo usermod -aG jackuser $USER
fi

if [[ $STUDIO -eq 1 ]]; then
    ARDOUR=Ardour-5.12.0-x86_64.run
    loc=''
    if [ -f ~/Downloads/$ARDOUR]; then
        loc=~/Downloads/$ARDOUR
    elif [ -f ./$ARDOUR ]; then
        loc=$ARDOUR
    else
        echo "Could not find Ardour!"
        exit
    fi

    sudo dnf install kernel-tools
    sudo cpupower frequency-set --governor performance

    #sudo dnf install cpufrequtils -y
    #sudo su
    #echo 'GOVERNOR="performance"' > /etc/default/cpufrequtils
    #exit

    sudo chmod +x $loc
    . $loc
fi

if [[ $STEAM -eq 1 ]]; then
    sudo dnf install \
    https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y

    sudo dnf install \
    https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

    sudo dnf install steam -y
fi

if [[ $NETWORK -eq 1 ]]; then
    sudo dnf install nmap -y
    sudo dnf install sshfs -y
fi
