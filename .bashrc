# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

export EXTERNAL_LIBCLANG_PATH=${HOME}/llvm-9.0.0-x86_64-linux-sles11.3/lib/

# User specific aliases and functions
RED="\[$(tput setaf 1)\]"
GREEN="\[$(tput setaf 2)\]"
YELLOW="\[$(tput setaf 3)\]"
BLUE="\[$(tput setaf 4)\]"
PURPLE="\[$(tput setaf 5)\]"
RESET="\[$(tput sgr0)\]"

PS1="${GREEN}\A ${PURPLE}\W ${RED}$ ${RESET}"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

alias rmswp="find . -name .*.swp -exec rm {} +"
alias rmun="find . -name *.un~ -exec rm {} +"
function _vim {
    /usr/bin/vim $@ &&
    rmswp
}
alias vim=_vim
function _zvim(){
    file=$(fzf)
    echo $file
    vim $file
}
alias zvim=_zvim

export PROJECTS=${HOME}/projects

function agc {
    SEARCH=$1
    if [ -z $SEARCH ]; then
        ag -h
    else
        ag "$SEARCH" $(find . -name \*.c)
    fi
}

function agsv {
    SEARCH=$1
    if [ -z $SEARCH ]; then
        ag -h
    else
        ag "$SEARCH" $(find . -name \*.sv)
    fi
}

function proxy {
    if [ -z "$1" ]; then
        echo "Give me a hostname"
        return
    fi

    killall ssh

    if [ -z "$2" ]; then
        PORT=8080
    else
        PORT=$2
    fi
    ssh -D$PORT $1 -N -f
}

function fn {
    find . -name $1
}

function vfn {
    vim $(find . -name $1)
}

export GOPATH=${HOME}/go
