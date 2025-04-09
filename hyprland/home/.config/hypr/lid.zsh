#!/usr/bin/zsh

#if [[ "$(hyprctl monitors)" =~ "\sDP-[0-9]+" ]]; then
if [[ $1 == "open" ]]; then
  # hyprctl keyword monitor "LVDS-1,preferred,auto,auto,bitdepth,10"
  ./toggle_monitors_enabled.zsh enable
else
  # hyprctl keyword monitor "LVDS-1,disable"
  ./toggle_monitors_enabled.zsh disable
fi
#fi
