if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xrdb -merge ~/.Xresources

#exec ck-launch-session startxfce4

setxkbmap fr

xscreensaver -no-splash &

trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 2 --transparent true --tint 0x191970 --height 12 &

exec ck-launch-session ~/.cabal/bin/xmonad

pkill -HUP ssh-agent


