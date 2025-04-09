#!/bin/zsh
#touch /run/user/1000/hypr/*/monitors_disabled
#echo $HYPRLAND_INSTANCE_SIGNATURE
#echo /run/user/1000/hypr/$HYPRLAND_INSTANCE_SIGNATURE/monitors_disabled
TOGGLE_FILE=/run/user/1000/hypr/$HYPRLAND_INSTANCE_SIGNATURE/monitors_disabled

function enable_monitors() {
  hyprctl dispatch dpms on # LVDS-1                                                             
  rm $TOGGLE_FILE
}

function disable_monitors() {
  hyprctl dispatch dpms off # LVDS-1                                                             
  touch $TOGGLE_FILE
}

#if [ ! -z "$1" ]; then
#  if [[ $1 == "enable" ]]; then
#    echo "enable"
#    enable_monitors
#  else
#    echo "disable"
#    disable_monitors
#  fi
#else
if [ -f $TOGGLE_FILE ]; then
  echo "File x found, enabling monitors"
  enable_monitors
else
  echo "File x not found, disabling monitors"
  disable_monitors
fi
#fi

#if [ -f $TOGGLE_FILE ]; then
#    echo "File x found, enabling monitors" # >> /tmp/monitors_disabled.log
#    hyprctl dispatch dpms on # LVDS-1
#    rm $TOGGLE_FILE
#else
#    echo "File x not found, disabling monitors" # >> /tmp/monitors_disabled.log
#    hyprctl dispatch dpms off # LVDS-1
#    touch $TOGGLE_FILE
#fi
