#!/bin/bash

DBUS_SESSION_BUS_ADDRESS="unix:path=$XDG_RUNTIME_DIR/bus" \
dbus-monitor "interface='org.freedesktop.Notifications',member='Notify'" |
while read -r line; do
    if [[ "$line" == *"method call"* && "$line" == *"member=Notify"* ]]; then
        ffplay -nodisp -autoexit -volume 50 \
            /usr/share/sounds/freedesktop/stereo/message.oga \
            >/dev/null 2>&1
    fi
done
