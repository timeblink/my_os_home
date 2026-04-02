#!/bin/sh

# export PATH="/usr/local/bin:$PATH"
# export ENV="$HOME/.kshrc"
# 
# xrdb -merge "$HOME/.Xresources"
# 
# if [ -x /usr/local/bin/dbus-launch -a -z "${DBUS_SESSION_BUS_ADDRESS}" ]; then
#     eval `dbus-launch --sh-syntax --exit-with-x11`
#     export DBUS_SESSION_BUS_ADDRESS
# fi
# 
# export LANG=zh_CN.UTF-8
# export LC_ALL=zh_CN.UTF-8
# 
# export XMODIFIERS="@im=fcitx5"
# export GTK_IM_MODULE="fcitx5"
# export QT_IM_MODULE="fcitx5"
# 
# /usr/local/bin/fcitx5 &
# 
# # 桌面壁纸设置
# feh --bg-scale $HOME/backgrounds/34.jpg &
# 
# # 禁止生成 core dump 文件
# ulimit -Sc 0
# 
# # 启动 picom 合成器
# picom -f &
# 
# # 启动 polybar 和 tint2 (进入 twm，i3，wmaker 时要关闭)
# polybar main &
# 
# tint2 &
# 
# # 锁屏设置
# xidle -timeout 1000 -program "/usr/X11R6/bin/xlock -mode random" &
# 
# # 将笔记本屏幕设为主显示器，外接显示器为副显示器，并将其放置在主显示器的右侧，使用推荐分辨率
# xrandr --output eDP-1 --primary --output HDMI-1 --right-of eDP-1 --auto
# 
# # Thinkpad TrackPoint 设置
# xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation" 1
# xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation Button" 2
# xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation Axes" 6 7 4 5
# 
# # 调整键盘重复速率
# xset r rate 250 30
# 
# # 窗口管理器（cwm，twm，i3，bspwm，spectrwm，wmaker）
# #exec cwm
# #exec twm
# #exec /usr/local/bin/i3
# #exec /usr/local/bin/bspwm
# #exec /usr/local/bin/spectrwm -c "$HOME/.spectrwm/spectrwm.conf"
# #exec /usr/local/bin/wmaker
# 