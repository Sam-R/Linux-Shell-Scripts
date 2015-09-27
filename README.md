# Linux-Shell-Scripts

A collection of useful shell scripts used on Debian based Linux distros.

##  Touchpad.sh

A script to enable or disable the touchpad of a laptop.

### How to use

1. Identify the input devices by running the following command:
```
xinput list
```

2. Find the ID of the device you want to disable from the list. EG:
```
↳ SynPS/2 Synaptics TouchPad              	id=11	[slave  pointer  (2)]
```

3. Edit the script to use the device ID by changing the line identifying device variable and save it: eg
```
device=11
```

4. Optionally, you can assign the command to a custom keyboard shortcut. This process varies depending on your Linux distro.

### References:
http://askubuntu.com/questions/65951/how-to-disable-the-touchpad

http://unix.stackexchange.com/questions/120199/how-to-detect-global-key-presses
