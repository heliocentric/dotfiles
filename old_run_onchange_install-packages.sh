#!/bin/sh
sudo apt install -y git git-lfs vim libfuse2 i3 i3blocks jq htop lxterminal kleopatra feh compton xfce4-terminal ruby ruby-dev build-essential pv libmariadb-dev xterm zfs-auto-snapshot meson valac libnautilus-extension-dev libhandy-1-dev libgtk-3-dev libglib2.0-dev gettext cmake autorandr syncthing digikam fish rofi
sudo snap install spotify discord
#curl -s --compressed https://raw.githubusercontent.com/kimono-koans/ppa/main/KEY.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/kimono-koans.gpg >/dev/null
# add package list to repos to search
#sudo curl -s --compressed -o /etc/apt/sources.list.d/kimono-koans.list "https://raw.githubusercontent.com/kimono-koans/ppa/main/kimono-koans.list"
# update apt
#sudo apt update
# install httm if you want
#sudo apt install httm
