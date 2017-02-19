#!/usr/bin/env python3

import dbus

try:
    session_bus = dbus.SessionBus()

    player = session_bus.get_object('org.mpris.MediaPlayer2.spotify', '/org/mpris/MediaPlayer2')
    iface = dbus.Interface(player, dbus_interface='org.freedesktop.DBus.Properties')

    metadata = iface.Get('org.mpris.MediaPlayer2.Player', 'Metadata')
    if "xesam:title" in metadata:
        if "xesam:artist" in metadata:
            print("Song: " + metadata["xesam:artist"][0] + " - " + metadata["xesam:title"])
        else:
            print("Song: " + metadata["xesam:title"])
    else:
        print("Song: -")
except:
    print("Song: -")
