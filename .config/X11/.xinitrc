# notification system
dunst & 
# mount devices automatically
udiskie &
# hide mouse when inactive
unclutter &
# run ibus to get those nice unicode characters from qmk
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
ibus-daemon -rxR &

# hack to fix xdg-desktop-portal timeout. taken from fix of cura ui
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY
systemctl start --user xdg-desktop-portal.service

export SSH_ASKPASS=ssh-askpass

exec i3
# log i3
# exec i3 -V -d all &>> "$HOME/i3.log"

