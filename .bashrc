#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias feh='feh -F -Z'
alias mpv='mpv --autofit=80% --fs=no --volume=20'
alias xreader='xreader -f'

set -o emacs

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
export GLFW_IM_MODULE=ibus
export INPUT_METHOD=ibus
export XIM=ibus
export XIM_PROGRAM=ibus

export EDITOR=vim

setxkbmap -option ""
setxkbmap -option "caps:ctrl_modifier,ctrl:nocaps"

export BDUSS="dadHVqbFJifjBUZVl6ZkdjaWFrRHJMM0FUOTQ4UjZUZlVuYlg2cW1GZThsSHBwSVFBQUFBJCQAAAAAAAAAAAEAAADxZYYMdGltZWJsaW5rAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAALwHU2m8B1NpMl"

alias x0='mpv --volume=30 --fs --loop-playlist=2 --shuffle --playlist=~/Videos/xrated.ssh/playlist.m3u8'
alias x1='mpv --volume=30 --fs --loop-playlist=4 --playlist=~/Videos/xrated.cut/playlist.m3u8'
alias gq='mpv --volume=75 --loop-playlist=inf --shuffle --playlist=/home/zzz/Music/老八张/playlist.m3u8'
alias baidu='baidupcs login --bduss=${BDUSS}'

export LANG=zh_CN.UTF-8
export LC_ALL=zh_CN.UTF-8
#export LANG=en_US.UTF-8
#export LANGUAGE=en_US:en
#export LC_ALL=C


# export TEXMFHOME=/home/zzz/texlive
# export TEXLIVE_INSTALL_PREFIX=/home/zzz/texlive
# export PATH=$PATH:/home/zzz/texlive/2025/bin/x86_64-linux
# export MANPATH=/home/zzz/texlive/2025/texmf-dist/doc/man:$MANPATH
# export INFOPATH=/home/zzz/texlive/2025/texmf-dist/doc/info:%INFOPATH

PS1='[\u@\h \W]\$ '

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
