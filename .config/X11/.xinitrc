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

exec i3
