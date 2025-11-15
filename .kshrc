##
## Author Kee Wan LEW 2025-08-24  v1.0.0 : setup PS1 in kshrc
##
# Get the aliases and functions
if [ -f ~/etc/kshrc ]; then
   . /etc/kshrc
fi
# User specific aliases and functions

# use emacs editing mode by default
set -o emacs
#export TERM="xterm-256color"
# custom vim setting
# use ctags-5.8
#export PATH="$HOME/bin:$PATH"
export PATH=$PATH:~/bin/
export PATH=$PATH:/opt/nvim/
export PATH="$HOME/.npm-global/bin:$PATH"

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im-fcitx
export XIM=fcitx
export XIM_PROGRAM=fcitx
#eval `dbus-launch --sh-syntax --exit-with-session`
#exec fcitx &

export LANG=zh_CN.UTF-8
export LC_ALL=zh_CN.UTF-8
#export LANG=en_US.UTF-8
#export LANGUAGE=en_US:en
#export LC_ALL=C

setxkbmap -option ""
setxkbmap -option "caps:ctrl_modifier,ctrl:nocaps"

#[ ! -z "$KITTY_WINDOW_ID" ] && export TERM=xterm-kitty
# User specific environment and startup programs
#
#---------------------color
#/* foreground colors */
#define AFC_BLACK           30
#define AFC_RED             31
#define AFC_GREEN           32
#define AFC_YELLOW          33
#define AFC_BLUE            34
#define AFC_MAGENTA         35
#define AFC_CYAN            36
#define AFC_WHITE           37

#/* ansi background colors */
#define ABC_BLACK           40
#define ABC_RED             41
#define ABC_GREEN           42
#define ABC_YELLOW          43
#define ABC_BLUE            44
#define ABC_MAGENTA         45
#define ABC_CYAN            46
#define ABC_WHITE           47
#/* ansi modes */
#define AM_NORMAL               0
#define AM_BOLD                 1
#define AM_LOWINTESITY          2
#define AM_ITALIC               3
#define AM_UNDERLINE            4
#define AM_BLINK                5
#define AM_RAPIDBLINK           6
#define AM_REVERSE              7
#define AM_INVISIBLE            8

OLOR_W="\033[37m"
NORM="\033[0m"
GREEN="\033[32m"
RED="\033[31m"
BG_RED_F_GREEN="\033[41;1;33m"
BG_YELLOW_F_BLACK="\033[43;1;30m"
BR_LINE="|_________________________________________________________________________________"

BR_SPACE="    "

YELLOW="\033[0;33m"
LBLUE="\033[1;34m"

alias rm='rm -i'
alias cd~='cd ~'
alias cd..='cd ..'
alias cd.='cd ../'
alias cd..='cd ../..'
alias cd...='cd ../../../'
alias cd....='cd ../../../../'
alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'
alias ls='ls --color'
alias ll='ls -ltr --color'
alias c='clear'
alias grep='grep --color'
alias bc='bc -l'
# to read patch group
#alias test_mail='mailx -s "test" om </dev/null '
alias lr='ls -ltr'
#alias nv='nvim '
#alias x0='mpv --no-fs --volume=10 --speed=1.05 --loop-playlist=inf --playlist=/home/zzz/Videos/xrated.cut/playlist1.m3u8'
#alias x1='mpv --no-fs --volume=10 --speed=1.00 --loop-playlist=no  --shuffle --playlist=/home/zzz/Videos/xrated.ssh/playlist1.m3u8'
#alias x2='mpv --no-fs --volume=10 --speed=1.00 --loop-playlist=inf --shuffle --playlist=/home/zzz/Videos/xrated.ssh/playlist2.m3u8'
#alias x3='mpv --no-fs --volume=10 --speed=1.00 --loop-playlist=no  --playlist=/home/zzz/Videos/xrated.ssh/playlist3.m3u8'
alias gq='mpv --no-fs --volume=80 --shuffle --loop-playlist=inf --playlist=/home/zzz/Music/老八张/playlist.m3u8'

# Main prompt function
prompt() {
    BR_LINE="|___________________________________________________________________"
    BG_RED_F_GREEN="\033[41;1;33m"
    BG_YELLOW_F_BLACK="\033[43;1;30m"
    NORM="\033[0m"
    # Build the dynamic prompt
    # echo -en "${BR_LINE}\n|${BG_RED_F_GREEN}$(whoami)${NORM}${BG_YELLOW_F_BLACK}:${NORM}${PWD}$|=> "
    echo -en "($(whoami))${PWD}:"
}
PS1='$(prompt)'
