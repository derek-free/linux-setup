xrandr --newmode "2560x1600_72" 423 2560 2760 3040 3520 1600 1603 1609 1670 -hsync +vsync
xrandr --addmode eDP-1 "2560x1600_72"
xrandr --output eDP-1 --mode "2560x1600_72"

echo "Xft.dpi: 144" | xrdb -merge
echo "Xcursor.size: 36" | xrdb -merge

xrandr --dpi 144
export XCURSOR_SIZE=36

xset s off
xset s noblank
xset -dmps

exec i3
