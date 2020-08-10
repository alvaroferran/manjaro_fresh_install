#!/bin/bash

# Window resize keybindings
dconf write /org/gnome/shell/extensions/pop-shell/tile-resize-down "['<Shift>Up']"
dconf write /org/gnome/shell/extensions/pop-shell/tile-resize-up "['<Shift>Down']"
dconf write /org/gnome/shell/extensions/pop-shell/tile-resize-right "['<Shift>Left']"
dconf write /org/gnome/shell/extensions/pop-shell/tile-resize-left "['<Shift>Right']"

# Workspace keybindings
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Ctrl><Alt>Left']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Ctrl><Alt>Right']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['<Ctrl><Alt>Up']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['<Ctrl><Alt>Down']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left "['<Shift><Ctrl><Alt>Left']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right "['<Shift><Ctrl><Alt>Right']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up "['<Shift><Ctrl><Alt>Up']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down "['<Shift><Ctrl><Alt>Down']"

# Modify default keybindings that interfere with normal operation
gsettings set org.gnome.desktop.wm.keybindings toggle-maximized "['<Super>F']"
gsettings set org.gnome.desktop.wm.keybindings maximize []
gsettings set org.gnome.desktop.wm.keybindings unmaximize []
gsettings set org.gnome.mutter.keybindings toggle-tiled-left []
gsettings set org.gnome.mutter.keybindings toggle-tiled-right []
