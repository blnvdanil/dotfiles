#!/bin/bash
#img=/tmp/i3lock.png
#
#grim $img
#convert $img -scale 10% -scale 100% $img
#
#swaylock -u -i $img


swaylock \
  --screenshot \
  --effect-blur 7x5 \
  --clock \
  --indicator \
  --font 'JetBrainsMono' \
  --font-size 30 \
  --fade-in 0.5 \
  --timestr '%H:%M' \
  --datestr 'enter pw' \
  --indicator-idle-visible \
  --ring-color 282828 \
  --key-hl-color 577644 \
  --ring-ver-color 282828 \
  --inside-ver-color 282828 \
  --inside-color 1a1818 \
  --daemonize \
  --ignore-empty-password \
  --grace '3' \
  --show-failed-attempts

