#!/bin/bash

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

brew install cmake

cp ./.vimrc ~/

vim +PluginInstall +quitall

cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer


