#!/bin/bash

DOT_FILES=( .zsh .zshrc .zshenv .gdbinit .gitconfig .gitignore .vimrc .tmux.conf .dir_colors )

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

