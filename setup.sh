#!/bin/bash

DOT_FILES=( .zsh .zshrc .zshenv .gdbinit .gitconfig .gitignore .vimrc .gvimrc .tmux.conf .dir_colors .config/starship.toml .config/nvim .config/alacritty )

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done
