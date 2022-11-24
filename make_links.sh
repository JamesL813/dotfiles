#!/bin/bash
cd $HOME
ln -s .config/dotfiles/zsh/zshenv .zshenv
ln -s .config/dotfiles/vimrc .vimrc
cd $XDG_CONFIG_HOME

# zsh
ln -s dotfiles/zsh zsh

# lf
ln -s dotfiles/lf lf

# neovim
ln -s dotfiles/nvim nvim

# starship
ln -s dotfiles/starship.toml starship.toml

# alacritty
mkdir alacritty
cd alacritty
ln -s ../dotfiles/alacritty.yml alacritty.yml

