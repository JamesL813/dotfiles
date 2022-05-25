#!/bin/bash
cd $HOME
ln -s .config/dotfiles/zsh/zshenv .zshenv
ln -s .config/dotfiles/vimrc .vimrc
cd .config

# zsh
mkdir zsh
ln -s dotfiles/zsh/zshrc zsh/.zshrc

# lf
mkdir lf
ln -s dotfiles/lf/_lf lf/_lf
ln -s dotfiles/lf/colors lf/colors
ln -s dotfiles/lf/icons lf/icons
ln -s dotfiles/lf/lf.vim lf/lf.vim
ln -s dotfiles/lf/lfcd.sh lf/lfcd.sh
ln -s dotfiles/lf/lfrc lf/lfrc
ln -s dotfiles/lf/pv.sh lf/pv.sh

# neovim
mkdir nvim
ln -s dotfiles/nvim/init.vim nvim.init.vim

# starship
ln -s dotfiles/starship.toml starship.toml

# alacritty
mkdir alacritty
ln -s dotfiles/alacritty.yml alacritty.yml

