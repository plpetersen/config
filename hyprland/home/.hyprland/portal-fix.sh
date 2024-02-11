#!/bin/bash
sleep 1
killall -e xdg-desktop-portal-hyprland
killall -e xdg-desktop-portal-wlr
killall xdg-desktop-portal
/usr/libexec/xdg-desktop-portal-hyprland > /tmp/hyprp &
sleep 2
/usr/libexec/xdg-desktop-portal > /tmp/normp &
