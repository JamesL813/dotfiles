#!/bin/bash

# basic
sudo pacman -Syu
sudo pacman -S git neovim firefox htop zsh openssh
chsh -s $(which zsh)

# aur helper paru
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

# zsh extension
paru -S zsh-autosuggestions zsh-completions zsh-history-substring-search zsh-syntax-highlighting zsh-theme-powerlevel10k

# rust replacements
paru -S rustup exa bat rg fd sd bottom dust procs diskonaut tealdeer

# cli tools
paru -S lf fzf translate-shell

# other
paru -S enpass-bin protonvpn-cli qbittorrent
