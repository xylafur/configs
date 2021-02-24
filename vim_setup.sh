OS="$(cat /etc/os-release  | grep -E "^ID=.*" | cut -d'=' -f2)"

if [ "$OS" = 'fedora' ]; then
    INSTALL="dnf install"
elif [ "$OS" = 'arch' ]; then
    INSTALL="pacman -S"
else
    echo "Unknown linux distro!"
    exit
fi

sudo $INSTALL vim
cp .vimrc ~/.vimrc
mkdir -p ~/.vim/{,tmp,plugin,pack,vendor/Spacegray,bundle}
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone git://github.com/ajh17/Spacegray.vim ~/.vim/pack/vendor/start/Spacegray
