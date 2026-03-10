#!/usr/bin/env bash

export EDITOR="emacsclient -c"
export EDITOR="emacsclient -nw"
function emacs-server(){
  if [ -f /home/syz/emacs.pid ]; then kill `cat /home/syz/emacs.pid` ; fi
  rm -rf /home/syz/emacs.pid
  #/usr/bin/emacs --name emacs --daemon --no-desktop --kill \
  #  -l ~/.emacs.d/init.el --eval '(server-start)' &>/dev/null &
  /usr/bin/emacs --eval '(color-theme-sanityinc-tomorrow-eighties)' \
    --daemon &>/dev/null &
  echo "$!" > /home/syz/emacs.pid
}
alias emacs="emacsclient -t"
alias emacs="emacsclient"

#alias m-left='pointer = 3 2 1 5 4'
#alias m-right='pointer = 1 2 3 5 4'
#xmodmap -e "pointer = 1 2 3 5 4 7 6 8 9 10 11 12" # mouse like mac
#xmodmap -e "pointer = 3 2 1 5 4" # mouse like mac wiwth left hand
#xmodmap -e "pointer = 1 2 3 4 5" # mouse like window
#xmodmap -e "clear lock" #disable caps lock switch
#setxkbmap -option ""
#setxkbmap -option "caps:ctrl_modifier,ctrl:nocaps"

function tmux-load(){
  which tmux >/dev/null 2>&1 || exit 1
  tmux -L self start
  tmux -L self new -d -s hi -n sh
}
alias tmux-att='tmux -L self att'
alias tmux-www='tmux -L self att -t www'

#export VISUAL="/usr/bin/subl"
##export VISUAL="gvim"
##export VISUAL="vim"
#export EDITOR="vim"
#
#export GTK_IM_MODULE=fcitx
#export QT_IM_MODULE=fcitx
#export XMODIFIERS=@im-fcitx
#export XIM=fcitx
#export XIM_PROGRAM=fcitx
#eval `dbus-launch --sh-syntax --exit-with-session`
#exec fcitx &
#
##alias x0='mpv --no-fs --volume=10 --speed=1.05 --loop-playlist=inf --playlist=/home/zzz/Videos/xrated.cut/playlist1.m3u8'
##alias x1='mpv --no-fs --volume=10 --speed=1.00 --loop-playlist=no  --shuffle --playlist=/home/zzz/Videos/xrated.ssh/playlist1.m3u8'
##alias x2='mpv --no-fs --volume=10 --speed=1.00 --loop-playlist=inf --shuffle --playlist=/home/zzz/Videos/xrated.ssh/playlist2.m3u8'
##alias x3='mpv --no-fs --volume=10 --speed=1.00 --loop-playlist=no  --playlist=/home/zzz/Videos/xrated.ssh/playlist3.m3u8'
#alias gq='mpv --no-fs --volume=80 --shuffle --loop-playlist=inf --playlist=/home/zzz/Music/老八张/playlist.m3u8'
#
#export LANG=zh_CN.UTF-8
#export LC_ALL=zh_CN.UTF-8
##export LANG=en_US.UTF-8
##export LANGUAGE=en_US:en
##export LC_ALL=C
#
#
## export TEXMFHOME=/home/zzz/texlive
## export TEXLIVE_INSTALL_PREFIX=/home/zzz/texlive
## export PATH=$PATH:/home/zzz/texlive/2025/bin/x86_64-linux
## export MANPATH=/home/zzz/texlive/2025/texmf-dist/doc/man:$MANPATH
## export INFOPATH=/home/zzz/texlive/2025/texmf-dist/doc/info:%INFOPATH

