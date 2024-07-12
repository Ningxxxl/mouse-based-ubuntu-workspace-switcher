echo "cur $(xdotool get_desktop)"
echo "tot $(expr $(xdotool get_num_desktops) - 1)"

echo "$(( $(xdotool get_desktop) <= 0 ? $(xdotool get_desktop) : $(expr $(xdotool get_desktop) - 1) ))"

$(xdotool set_desktop $(( $(xdotool get_desktop) <= 0 ? $(xdotool get_desktop) : $(expr $(xdotool get_desktop) - 1) )))