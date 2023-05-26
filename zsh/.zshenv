#!/bin/sh

autoload -Uz compinit
compinit

# clean up home directory
export XDG_CONFIG_HOME=$HOME'/.config'
export XDG_CACHE_HOME=$HOME'/.cache'
export XDG_DATA_HOME=$HOME'/.local/share'
export XDG_STATE_HOME=$HOME'/.local/state'
export EDITOR='/usr/bin/nvim'
export ZDOTDIR=$XDG_CONFIG_HOME'/zsh'

export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages

export TEXMFVAR="$XDG_CACHE_HOME"/texlive/texmf-var

export GOPATH="$XDG_DATA_HOME"/go
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export HISTFILE="$XDG_STATE_HOME"/zsh/history

export TODO_DIR="$XDG_DATA_HOME"/todo
export TODO_FILE="$TODO_DIR"/todo.txt
export DONE_FILE="$TODO_DIR"/done.txt
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"

zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zsh/zcompcache

export CARGO_HOME=$XDG_DATA_HOME'/cargo'
#export _JAVA_OPTIONS=-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME'/java'
export LEIN_HOME="$XDG_DATA_HOME"/lein

export DOOMWADDIR="$HOME"/Games/doom

alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'
#export WGETRC="$XDG_CONFIG_HOME/wgetrc"
#alias wget = 'wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'
alias irssi="irssi --config="$XDG_CONFIG_HOME"/irssi/config --home="$XDG_DATA_HOME"/irssi"


export WINIT_UNIX_BACKEND=x11

# playdate
export PLAYDATE_SDK_PATH=$XDG_DATA_HOME'/PlaydateSDK-1.9.3'

# add bin folders to path
export PATH=$PATH':'$PLAYDATE_SDK_PATH'/bin'
export PATH=$PATH':'$HOME'/.local/bin'
export PATH=$PATH':'$XDG_DATA_HOME'/go/bin'
export PATH=$PATH':'$XDG_DATA_HOME'/cargo/bin'
. "/home/james/.local/share/cargo/env"
