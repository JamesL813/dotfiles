#!/bin/bash
cd $HOME
rm .zshenv
rm .vimrc
ln -s .config/dotfiles/zsh/zshenv .zshenv
ln -s .config/dotfiles/vimrc .vimrc
cd $XDG_CONFIG_HOME

# zsh
rm -rf zsh
ln -s dotfiles/zsh zsh

# lf
rm -rf lf
ln -s dotfiles/lf lf

# neovim
rm -rf nvim
ln -s dotfiles/nvim nvim

# starship
rm starship.toml
ln -s dotfiles/starship.toml starship.toml

# alacritty
mkdir alacritty
cd alacritty
ln -s ../dotfiles/alacritty.yml alacritty.yml

