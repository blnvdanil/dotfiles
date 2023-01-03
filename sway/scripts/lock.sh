img=/tmp/i3lock.png

grim $img
convert $img -scale 10% -scale 100% $img

swaylock -u -i $img
