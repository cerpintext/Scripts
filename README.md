# QoL-scripts

Author: Kristian S. Holm
Email: krisshol@stud.ntnu.no


## Notes

This script, Notes, is intended to start up the preferred editor and organise the file directories (documents/ntnu/..etc..etc..) with only a few button presses.
This is subject to change for when I experience a feature lacking.

One way to use scripts can be:
1. 'sudo chmod  755 notes'    set permissions
2. 'sudo cp notes /usr/bin'   make Notes available globally for user
3. '$ notes -s <subject>'   Run with param -s and name subject


## Keyboard

Keyboard is a hacky workaround due to problems with xorg and i3 affecting ability to change between keyboard layouts.

I have implemented so it switches between US and NO keyboard layouts, but to add any more just need to add it to the array $layouts.


## Bright

Bright is a short script to control the brightness of the monitor. As of now it only supports intel integrated graphics.
To use it, call the script with -inc or -dec followed by an integer.
Personally I have it bound to my laptop's brightness down and up keys, changing 50 points respectively for each.
