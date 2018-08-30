# Notes

Author: Kristian S. Holm
Email: krisshol@stud.ntnu.no

This script, Notes, is intended for me personally to start up my preferred editor and organise thefile tree (documents/ntnu/..etc..etc..) with only a few button presses.
This is not perfectly made and will be improved on when I have ideas.

One way to use scripts can be:
1. 'sudo chmod  755 notes'    set permissions
2. 'sudo cp notes /usr/bin'   make Notes available globally for user
3. '$ notes -s <subject>'   Run with param -s and name subject


# Keyboard

Keyboard is a hacky workaround due to problems with xorg and i3 affecting ability to change between keyboard layouts.

I have implemented so it switches between US and NO keyboard layouts, but to add any more just need to add it to the array $layouts.
