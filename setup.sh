#!/bin/bash

brew install cmake

cp -f .vimrc ~/.

vim +PluginInstall +quitall

cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
