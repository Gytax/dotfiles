#!/bin/bash
if xrandr --current | grep "DP1-1 connected"; then
  xrandr --auto --output DP1-1 --mode 1920x1080 --auto --output DP1-2 --right-of DP1-1 --mode 1920x1080 --auto --output eDP1  --right-of DP1-2 --mode 1920x1080
elif xrandr --current | grep "HDMI1 connected"; then
  xrandr --auto --output HDMI1 --mode 2560x1440 --left-of eDP1
else
  xrandr --auto --output eDP1 --mode 1920x1080
fi