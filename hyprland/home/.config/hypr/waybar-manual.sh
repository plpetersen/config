nohup waybar 1>/tmp/waybar-manual.log 2>/tmp/waybar-error.log &
sleep 5 && killall -SIGUSR1 waybar 
