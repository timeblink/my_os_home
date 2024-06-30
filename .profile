#!/usr/bin/env bash

#export EDITOR="emacsclient -c"
#export EDITOR="emacsclient -nw"

#function emacs-server(){
#  if [ -f /home/syz/emacs.pid ]; then kill `cat /home/syz/emacs.pid` ; fi
#  rm -rf /home/syz/emacs.pid
#  #/usr/bin/emacs --name emacs --daemon --no-desktop --kill \
#  #  -l ~/.emacs.d/init.el --eval '(server-start)' &>/dev/null &
#  /usr/bin/emacs --eval '(color-theme-sanityinc-tomorrow-eighties)' \
#    --daemon &>/dev/null &
#  echo "$!" > /home/syz/emacs.pid
#}
#alias emacs="emacsclient -t"
#alias emacs="emacsclient"

#alias m-left='pointer = 3 2 1 5 4'
#alias m-right='pointer = 1 2 3 5 4'
#xmodmap -e "pointer = 1 2 3 5 4 7 6 8 9 10 11 12" # mouse like mac
#xmodmap -e "pointer = 3 2 1 5 4" # mouse like mac wiwth left hand
#xmodmap -e "pointer = 1 2 3 4 5" # mouse like window
#xmodmap -e "clear lock" #disable caps lock switch
setxkbmap -option ""
setxkbmap -option "caps:ctrl_modifier,ctrl:nocaps"

function tmux-load(){
  which tmux >/dev/null 2>&1 || exit 1
  tmux -L self start
  tmux -L self new -d -s hi -n sh
}
alias tmux-att='tmux -L self att'
alias tmux-www='tmux -L self att -t www'

export VISUAL="/usr/bin/subl3"
#export VISUAL="gvim"
#export VISUAL="vim"
export EDITOR="vim"
