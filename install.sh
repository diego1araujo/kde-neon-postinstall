#!/bin/bash

echo -e "Remove packages\n"
sudo apt -y purge firefox kwrite vim kwalletmanager libkf5wallet-bin kde-spectacle gwenview okular
sudo apt -y autoremove

echo -e "Add PPA's\n"
sudo add-apt-repository -y ppa:jurplel/qview
sudo add-apt-repository -y ppa:agornostal/ulauncher
sudo add-apt-repository -y ppa:obsproject/obs-studio
sudo add-apt-repository -y ppa:stebbins/handbrake-releases
sudo add-apt-repository -y ppa:kdenlive/kdenlive-stable
sudo add-apt-repository -y ppa:haraldhv/shotcut
sudo add-apt-repository -y ppa:git-core/ppa
sudo add-apt-repository -y ppa:ondrej/php

echo -e "Upgrade system\n"
sudo pkcon -y refresh
sudo pkcon -y update
sudo apt -y update
sudo apt -y dist-upgrade

echo -e "Install drivers\n"
sudo ubuntu-drivers install

echo -e "Install packages\n"
sudo apt -y install software-properties-common apt-transport-https libsdl2-dev curl wget openssl

echo -e "Download and install Google Chrome / Replacement for Firefox\n"
wget -cO google-chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome.deb
sudo apt -y install -f

echo -e "Download and install Brave Browser / Replacement for Firefox\n"
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt -y update
sudo apt -y install brave-browser

echo -e "Install Git\n"
sudo apt -y install git
echo -e "Do not forget to config your git"
echo -e "git config --global user.name \"Your name\""
echo -e "git config --global user.email your@email.com"
echo -e "git config --global init.defaultBranch main"
echo -e "git config --global --list"
echo -e "And also generate an ssh key: ssh-keygen -t rsa -C \"your@email.com\"\n"

echo e- "Install dependencies for PHP\n"
sudo apt -y install network-manager libnss3-tools jq xsel

echo -e "Install PHP\n"
sudo apt -y install php8.0-fpm php8.0-cli php8.0-{common,bcmath,mbstring,xml,mysql,zip,curl,opcache,readline,gd}

echo -e "Install MySQL\n"
sudo apt -y install mysql-server

echo -e "Install Composer\n"
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
echo 'export PATH="$PATH:$HOME/.config/composer/vendor/bin"' >> ~/.bashrc

echo -e "Install Nodejs and NPM\n"
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt -y install nodejs

echo -e "Install Visual Studio Code\n"
wget -qO - https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo add-apt-repository -y "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt -y update
sudo apt -y install code

echo -e "Install Sublime Text 3 / Replacement for KWrite\n"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt -y update
sudo apt -y install sublime-text

echo -e "Install Docker\n"
sudo apt -y install docker.io docker-compose

echo -e "Install qView / Replacement for Gwenview\n"
sudo apt -y install qview

echo -e "Install Flameshot / Replacement for Spectacle\n"
sudo apt -y install flameshot

echo -e "Install ULauncher / Replacement for kRunner\n"
sudo apt -y install ulauncher

echo -e "Install Spotify\n"
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt -y update
sudo apt -y install spotify-client

echo -e "Install OBS Studio\n"
sudo apt -y install ffmpeg obs-studio

echo -e "Install Kdenlive\n"
sudo apt -y install kdenlive

echo -e "Install Shotcut\n"
sudo apt -y install shotcut

echo -e "Install Handbrake\n"
sudo apt -y install handbrake-gtk handbrake-cli

echo -e "Install Virtualbox\n"
wget -cO virtualbox.deb https://download.virtualbox.org/virtualbox/6.1.16/virtualbox-6.1_6.1.16-140961~Ubuntu~eoan_amd64.deb
sudo dpkg -i virtualbox.deb
sudo apt -y install -f

echo -e "Install Discord\n"
wget -cO discord.deb https://discordapp.com/api/download?platform=linux&format=deb
sudo dpkg -i discord.deb
sudo apt -y install -f

echo -e "Install Steam\n"
wget -cO steam.deb http://repo.steampowered.com/steam/archive/precise/steam_latest.deb
sudo dpkg -i steam.deb
sudo apt -y install -f

echo -e "Install Gnome Disk Utility\n"
sudo apt -y install gnome-disk-utility

echo -e "Install Gnome Calculator\n"
sudo apt -y install gnome-calculator

echo -e "Install Disk Usage Analyzer\n"
sudo apt -y install baobab

echo -e "Install Neofetch\n"
sudo apt -y install neofetch

echo -e "Install Tela Icon Theme\n"
git clone https://github.com/vinceliuice/Tela-icon-theme.git
sudo bash ./Tela-icon-theme/install.sh

echo -e "Install Layan KDE Theme\n"
git clone https://github.com/vinceliuice/Layan-kde.git
sudo bash ./Layan-kde/install.sh

echo -e "Clear system cache\n"
rm -rf ~/.cache/plasm* ~/.cache/ico*
sudo apt -y clean

echo "The installation was finished"
