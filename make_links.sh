#!/bin/bash
cd $HOME
ln -s .config/dotfiles/zsh/zshenv .zshenv
ln -s .config/dotfiles/vimrc .vimrc
cd .config

# zsh
mkdir zsh
cd zsh
ln -s ../dotfiles/zsh/zshrc .zshrc
ln -s ../dotfiles/zsh/p10k.zsh .p10k.zsh

cd ..
# lf
mkdir lf
cd lf
rm -f *
ln -s ../dotfiles/lf/_lf _lf
ln -s ../dotfiles/lf/colors colors
ln -s ../dotfiles/lf/icons icons
ln -s ../dotfiles/lf/lf.vim lf.vim
ln -s ../dotfiles/lf/lfcd.sh lfcd.sh
ln -s ../dotfiles/lf/lfrc lfrc
ln -s ../dotfiles/lf/pv.sh pv.sh
cd ..
# neovim
mkdir nvim
cd nvim
rm init.vim
ln -s ../dotfiles/nvim/init.vim init.vim
cd ..
# starship
ln -s dotfiles/starship.toml starship.toml

# alacritty
mkdir alacritty
cd alacritty
ln -s ../dotfiles/alacritty.yml alacritty.yml

