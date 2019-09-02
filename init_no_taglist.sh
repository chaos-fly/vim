#!/bin/bash

cd ~/
mkdir -p ~/.vim/doc
mkdir -p ~/.vim/plugin

# .gitconfig
if [ ! -f .gitconfig ]; then
    ln -s /data/myvim/gitconfig .gitconfig
fi

# .vimrc
if [ ! -L .vimrc ];then
    if [ -f .vimrc ];then
        echo "mv .vimrc .vimrc_back"
        mv .vimrc .vimrc_bak
    fi
    echo "ln -s /data/myvim/vimrc .vimrc"
    ln -s /data/myvim/vimrc .vimrc
fi

# .vim/doc
if [ ! -L .vim/doc ];then
    if [ -d .vim/doc ];then
        echo "bak .vim/doc"
        mv .vim/doc .vim/doc_bak
    fi
    ln -s /data/myvim/doc_no_taglist .vim/doc
fi

# .vim/plugin
if [ ! -L .vim/plugin ];then
    if [ -d .vim/plugin ];then
        echo "bak .vim/plugin"
        mv .vim/plugin .vim/plugin_bak
    fi
    ln -s /data/myvim/plugin_no_taglist .vim/plugin
fi

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim


