#!/bin/bash

echo "[wlogout] Se llamó hyprlock a las $(date)" >> ~/.wlogout.log
hyprlock -c ~/.config/hyprlock/config >> ~/.wlogout.log 2>&1
