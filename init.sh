#!/bin/bash

cd ~/

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
    if [ -f .vim/doc ];then
        echo "bak .vim/doc"
        mv .vim/doc .vim/doc_bak
    fi
    ln -s /data/myvim/doc .vim/doc
fi

# .vim/plugin
if [ ! -L .vim/plugin ];then
    if [ -f .vim/plugin ];then
        echo "bak .vim/plugin"
        mv .vim/plugin .vim/plugin
    fi
    ln -s /data/myvim/plugin .vim/plugin
fi


