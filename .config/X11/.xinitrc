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

# Dark theme
export GTK_THEME=Adwaita:dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
export QT_STYLE_OVERRIDE=adwaita-dark

exec i3
