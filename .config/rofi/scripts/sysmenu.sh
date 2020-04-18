#!/bin/bash

MENU="$(rofi -sep "|" -dmenu -i -p 'System' -theme 'themes/menus/sysmenu.rasi' -lines 4 <<< " Lock| Logout| Reboot| Shutdown")"
            case "$MENU" in
                *Lock) xflock4;;
                *Logout) xfce4-session-logout;;
                *Reboot) systemctl reboot ;;
                *Shutdown) systemctl -i poweroff
            esac
