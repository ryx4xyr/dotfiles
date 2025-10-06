#!/bin/bash

ICON="$1"

eww update media_icon="$ICON"
eww open media-overlay
sleep 1.2
eww close media-overlay
