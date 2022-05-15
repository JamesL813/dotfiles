#!/bin/zsh

autoload -Uz compinit
compinit

# clean up home directory
export XDG_CONFIG_HOME=$HOME'/.config'
export XDG_CACHE_HOME=$HOME'/.cache'
export XDG_DATA_HOME=$HOME'/.local/share'
export XDG_STATE_HOME=$HOME'/.local/state'
export EDITOR='/usr/bin/nvim'
export ZDOTDIR=$XDG_CONFIG_HOME'/zsh'
export HISTFILE=$XDG_STATE_HOME'/zsh/history'
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zsh/zcompcache
export CARGO_HOME=$XDG_DATA_HOME'/cargo'
#export _JAVA_OPTIONS=-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME'/java'
export LEIN_HOME="$XDG_DATA_HOME"/lein
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'
#export WGETRC="$XDG_CONFIG_HOME/wgetrc"
#alias wget = 'wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'
alias irssi="irssi --config="$XDG_CONFIG_HOME"/irssi/config --home="$XDG_DATA_HOME"/irssi"
 	
#
export WINIT_UNIX_BACKEND=x11

# playdate
export PLAYDATE_SDK_PATH=$XDG_DATA_HOME'/PlaydateSDK-1.9.3'
export PATH=$PATH':'$PLAYDATE_SDK_PATH'/bin'

