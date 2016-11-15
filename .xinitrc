if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/?* ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

xrdb -load ~/.Xresources

#irc notifications
dunst &

#layout to dvorak
setxkbmap dvorak
xsetroot -cursor_name left_ptr &

#Set natural scrolling
synclient VertScrollDelta=-94
synclient HorizScrollDelta=-94

#Disable trackpad for two seconds after typing
syndaemon -t -k -d -i 2 &
pulseaudio --start

#Set Background
sh ~/.fehbg &

wew | fw &

#set sxhkd
sxhkd -m -1 -c ~/.config/sxhkd/.sxhkdrc > ~/.local/sxhkdlog.txt 2>&1 &

#mount my favorite usb drive
#sudo mount -o gid=users,fmask=113,dmask=002 /dev/sdb1 /mnt/usb_integrated

exec bspwm -s "$PANEL_FIFO" -p W
