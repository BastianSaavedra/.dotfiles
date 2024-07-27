#!/bin/sh

# System Icon

udiskie -t &

nm-applet &

volumeicon &

cbatticon &

volnoti &

nitrogen --restore &

blueman-applet &

pcloud &

picom &

xrandr --output HDMI-0 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output DP-0 --mode 1920x1080 --pos 3852x0 --rotate normal --output DP-1 --off --output eDP-1-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1-1 --off --output HDMI-1-1 --off
