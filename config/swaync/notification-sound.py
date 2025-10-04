#!/usr/bin/env python3

import dbus
from gi.repository import GLib
from dbus.mainloop.glib import DBusGMainLoop
import subprocess

def notify_handler(bus, message):
	if message.get_member() == "Notify":
		subprocess.Popen(["paplay", "/home/kry_/Música/tones/tone-2.ogg"])

DBusGMainLoop(set_as_default=True)
bus = dbus.SessionBus()
bus.add_match_string("interface='org.freedesktop.Notifications'")
bus.add_message_filter(notify_handler)

loop = GLib.MainLoop()
loop.run()
