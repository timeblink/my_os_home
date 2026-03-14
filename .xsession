#!/bin/bash

#~/.xsession
#通过显示管理器登录
#设置图形会话环境、启动窗口管理器/DE

#~/.xinitrc
#通过 startx命令启动 X
#同上，但用于 startx场景

#~/.xprofile
#显示管理器登录前
#设置环境变量（不启动图形程序）

#~/.profile
#命令行登录/SSH 登录
#设置 Shell 环境变量

#export GTK_IM_MODULE=fcitx
#export XMODIFIERS=@im=fcitx
#export QT_IM_MODULE=fcitx
#export GLFW_IM_MODULE=fcitx
#export INPUT_METHOD=fcitx
#export XIM=fcitx
#export XIM_PROGRAM=fcitx
#export EDITOR=vim
#export LANG=zh_CN.UTF-8
#export LC_ALL=zh_CN.UTF-8

setxkbmap -option ""
setxkbmap -option "caps:ctrl_modifier,ctrl:nocaps"

