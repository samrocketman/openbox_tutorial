# This shell script is run before Openbox launches.
# Environment variables set here are passed to the Openbox session.

# Set a background color
BG=""
if which hsetroot >/dev/null; then
    BG=hsetroot
else
    if which esetroot >/dev/null; then
	BG=esetroot
    else
	if which xsetroot >/dev/null; then
	    BG=xsetroot
	fi
    fi
fi
test -z $BG || $BG -solid "#303030"

# D-bus
if which dbus-launch >/dev/null && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
       eval `dbus-launch --sh-syntax --exit-with-session`
fi

# Make GTK apps look and behave how they were set up in the gnome config tools
if test -x /usr/libexec/gnome-settings-daemon >/dev/null; then
  /usr/libexec/gnome-settings-daemon &
elif which gnome-settings-daemon >/dev/null; then
  gnome-settings-daemon &
# Make GTK apps look and behave how they were set up in the XFCE config tools
elif which xfce-mcs-manager >/dev/null; then
  xfce-mcs-manager n &
fi

# Preload stuff for KDE apps
if which start_kdeinit >/dev/null; then
  LD_BIND_NOW=true start_kdeinit --new-startup +kcminit_startup &
fi

# Run XDG autostart things.  By default don't run anything desktop-specific
# See xdg-autostart --help more info
DESKTOP_ENV=""
if which /usr/lib/openbox/xdg-autostart >/dev/null; then
  /usr/lib/openbox/xdg-autostart $DESKTOP_ENV
fi

#Start Tint2
(sleep 2s && tint2) &

#Custom Background Bleach Wallpaper
#feh --bg-scale '/home/sam/Pictures/Forbidden_Words_by_M3_f_1024x600.jpg'
feh --bg-scale '/home/sam/Pictures/1024x600/one-piece-beach_1024x600.jpg'


#networking
nm-applet &

#power manager (battery display)
gnome-power-manager &

#share mouse and keyboard with desktop
#(sleep 15s && ping -c 1 stealth && synergyc stealth) &

#widgets
adesklets
adesklets -k
adesklets -d 5 &
#(sleep 9s && adesklets) &

#mac os x bar
(sleep 2s && wbar -bpress) &
