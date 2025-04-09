
sleep 10
nohup waybar 1>/tmp/waybar-auto.log 2>/tmp/waybar-auto.log &
sleep 5 && killall -SIGUSR1 waybar 
