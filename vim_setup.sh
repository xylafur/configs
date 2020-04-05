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
mkdir ~/.vim
mkdir ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir ~/.vim/plugin
mkdir ~/.vim/pack
mkdir ~/.vim/pack/vendor
mkdir ~/.vim/pack/vendor/Spacegray
git clone git://github.com/ajh17/Spacegray.vim ~/.vim/pack/vendor/start/Spacegray
