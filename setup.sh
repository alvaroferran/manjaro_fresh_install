#!/bin/bash

FOLDER=$(pwd)

# Select fastest mirrors
sudo pacman-mirrors --fasttrack
sudo pacman -Syyu --noconfirm

# Install Yay
pacman -S base-devel yay --noconfirm

# Install packages
yay --noconfirm -S \
  chromium \
  docker \
  terminator \
  community/libinput-gestures \
  aur/visual-studio-code-bin \
  kicad \
  blender \
  # freecad-appimage \
  cura \
  calibre \
  gimp \
  tmux \
  xdotool \
  wmctrl \
  xclip \
  iio-sensor-proxy

# Set up aliases
cp $FOLDER/aliases/.bash_aliases ~/
echo "if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi" >> ~/.bashrc

# Set up Docker
sudo systemctl enable docker.service
groupadd docker
sudo gpasswd -a $USER docker

# Set up Terminator
mkdir -p  ~/.config/terminator
cp $FOLDER/terminator/* ~/.config/terminator/

# Install autorotate
cd ~/Programs
git clone https://github.com/alvaroferran/AutoRotateScreen.git
chmod +x AutoRotateScreen/AutoRotateScreen.py
cd

# Install change_terminal
cd ~/Programs
git clone https://github.com/alvaroferran/change_terminal.git
chmod +x change_terminal/change_terminal.sh
cd

# Install gestures
mkdir -p ~/.config
cp $FOLDER/gestures/* ~/.config/
sudo gpasswd -a $USER input
libinput-gestures-setup autostart

# Set up VS Code
mkdir -p $HOME/.config/Code/User
cp $FOLDER/vscode/* $HOME/.config/Code/User/
code --install-extension ms-python.python
code --install-extension ms-vscode.cpptools
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-vscode-remote.vscode-remote-extensionpack
code --install-extension marus25.cortex-debug
code --install-extension akamud.vscode-theme-onedark
code --install-extension yzhang.markdown-all-in-one

# Install conda
cd ~/Programs
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
chmod +x miniconda.sh
./miniconda.sh -b -p $HOME/Programs/Conda -f
rm miniconda.sh
echo "# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/Programs/Conda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/Programs/Conda/etc/profile.d/conda.sh" ]; then
        . "$HOME/Programs/Conda/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/Programs/Conda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
" >>  ~/.bashrc
cd

# Reboot to set changes
sudo reboot
