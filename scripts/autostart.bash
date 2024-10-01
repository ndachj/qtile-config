#!/bin/bash

# Autostart user applications at login time.
# NOTE: Only add applications you need to avoid unnecessary resource usage.

# Function to check if a process is already running and run it if not
function run {
	if ! pgrep -x "$(basename $1 | head -c 15)" 1>/dev/null; then
		"$@"
	fi
}

# set wallpaper
feh --no-fehbg --bg-fill '/usr/share/images/desktop-base/desktop-background'
# feh --no-fehbg --bg-fill '/home/ndachj/.config/qtile/pics/fire-dog.jpg'

# turn off the console beep immediately
xset b off

# toggle NumLock on
run numlockx on

# PolicyKit Authentication Agent
run /usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &

# NetworkManager applet
run nm-applet &

# Power manger - xfce4-power-manager
run xfce4-power-manager --daemon

# Compositor - picom(with the default config)
run picom --config /dev/null &

# ALSA mixer systray icon
run volumeicon &

# Blueman Bluetooth applet
run blueman-tray &

# Screen locker
run light-locker &

# Clipboard manager - xfce4-clipman
run xfce4-clipman &

# Update common folders names to match current locale
# run xdg-user-dirs-update
# run xdg-user-dirs-gtk-update

# Kali Linux script to disable automount
run /usr/share/kali-defaults/setup-noautomount &
