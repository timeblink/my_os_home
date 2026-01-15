#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

set -o emacs

#export GTK_IM_MODULE=fcitx
#export QT_IM_MODULE=fcitx
#export XMODIFIERS=@im-fcitx
#export XIM=fcitx
#export XIM_PROGRAM=fcitx

#export GTK_IM_MODULE=fcitx5
#export QT_IM_MODULE=fcitx5
#export XMODIFIERS=@im-fcitx5
#export XIM=fcitx5
#export XIM_PROGRAM=fcitx5

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
export XIM=ibus
export XIM_PROGRAM=ibus

export EDITOR=vim

#eval `dbus-launch --sh-syntax --exit-with-session`
#exec fcitx &

setxkbmap -option ""
setxkbmap -option "caps:ctrl_modifier,ctrl:nocaps"

#alias x0='mpv --no-fs --volume=10 --speed=1.05 --loop-playlist=inf --playlist=/home/zzz/Videos/xrated.cut/playlist1.m3u8'
#alias x1='mpv --no-fs --volume=10 --speed=1.00 --loop-playlist=no  --shuffle --playlist=/home/zzz/Videos/xrated.ssh/playlist1.m3u8'
#alias x2='mpv --no-fs --volume=10 --speed=1.00 --loop-playlist=inf --shuffle --playlist=/home/zzz/Videos/xrated.ssh/playlist2.m3u8'
#alias x3='mpv --no-fs --volume=10 --speed=1.00 --loop-playlist=no  --playlist=/home/zzz/Videos/xrated.ssh/playlist3.m3u8'
alias gq='mpv --no-fs --volume=80 --shuffle --loop-playlist=inf --playlist=/home/zzz/Music/老八张/playlist.m3u8'

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
