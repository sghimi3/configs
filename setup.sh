#!/bin/bash

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir ~/.vim/colors
cp mycolorscheme.vim ~/.vim/colors
cp .bashrc .bash_aliases .vimrc .inputrc ~
source ~/.bashrc
