#!/bin/sh
openbox-xdgmenu /etc/xdg/menus/applications.menu | sed 's/\&[^a]/\&amp; /g'
