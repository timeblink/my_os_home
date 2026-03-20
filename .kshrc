#
# ~/.kshrc
#

export LANG=zh_CN.UTF-8
export LC_ALL=zh_CN.UTF-8

HISTFILE=$HOME/.ksh_history
HISTSIZE=9999
SAVEHIST=9999

#set -o emacs

export GTK_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export QT_IM_MODULE=fcitx
export GLFW_IM_MODULE=fcitx
export INPUT_METHOD=fcitx
export SDL_IM_MODULE=fcitx

export XIM=fcitx
export XIM_PROGRAM=fcitx
export EDITOR=vim

#PS1='[$(whoami)@$(hostname -s) $PWD]$ '
#PS1=' $PWD $ '
PS1='$PWD >_ '

[ -f ~/.shell_aliases ] && . ~/.shell_aliases
