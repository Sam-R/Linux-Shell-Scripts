#!/bin/bash
# Disable or enable the touchpad on a Lenovo X230
# This can be configued to work with a keypress using keyboard shortcuts in the control panel
# eg my thinkvantage button disables/enables the touchpad.

# These values may vary between machines
device=11
property=134

# Find out what mode the touchpad is on (enabled/disabled - 0/1)
mode="$(xinput list-props $device | grep $property | cut -d$'\t' -f3)"

# tell me what mode it is 
echo $mode

# Swap the modes over (enabled becomes disabled, etc)
if [ $mode -eq 1 ] ;
then
xinput set-prop $device $property 0
echo "set to mode 0"
else
xinput set-prop $device $property 1
echo "set to mode 1"
fi
