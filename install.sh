#!/bin/bash

echo "What's your git name?"
read git_name

echo "What's your git email?"
read git_email

sudo touch ~/.gitconfig ~/.zshrc

echo -e "Remove packages\n"
sudo apt -y purge firefox kwrite vim kwalletmanager libkf5wallet-bin kde-spectacle gwenview okular
sudo apt -y autoremove

echo -e "Add PPA's\n"
sudo add-apt-repository -y ppa:jurplel/qview
sudo add-apt-repository -y ppa:agornostal/ulauncher
sudo add-apt-repository -y ppa:obsproject/obs-studio
sudo add-apt-repository -y ppa:stebbins/handbrake-releases
sudo add-apt-repository -y ppa:kdenlive/kdenlive-stable
sudo add-apt-repository -y ppa:kritalime/ppa
sudo add-apt-repository -y ppa:git-core/ppa
sudo add-apt-repository -y ppa:ondrej/php

echo -e "Upgrade system\n"
sudo pkcon refresh
sudo pkcon -y update
sudo apt -y update
sudo apt -y dist-upgrade

echo -e "Install drivers\n"
sudo ubuntu-drivers install

echo -e "Install packages\n"
sudo apt -y install software-properties-common apt-transport-https libsdl2-dev curl wget openssl

echo -e "Download and install Google Chrome / Replacement for Firefox\n"
wget -cO google-chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt -y install ./google-chrome.deb
rm -f google-chrome.deb

echo -e "Download and install Brave Browser / Replacement for Firefox\n"
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt -y update && sudo apt -y install brave-browser

echo -e "Install Git\n"
sudo apt -y install git
git config --global user.name "$git_name"
git config --global user.email $git_email
git config --global init.defaultBranch main
ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa -C $git_email

echo e- "Install dependencies for PHP\n"
sudo apt -y install network-manager libnss3-tools jq xsel

echo -e "Install PHP\n"
sudo apt -y install php8.0-fpm php8.0-cli php8.0-{common,bcmath,mbstring,xml,mysql,zip,curl,opcache,pdo,ctype,tokenizer,fileinfo,sqlite3,redis}

echo -e "Install MySQL\n"
sudo apt -y install mysql-server

echo -e "Install Composer\n"
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
echo 'export PATH="$PATH:$HOME/.config/composer/vendor/bin"' >> ~/.bashrc
source ~/.bashrc

echo -e "Install Nodejs and NPM\n"
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt -y install nodejs

echo -e "Install Visual Studio Code\n"
wget -qO - https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo add-apt-repository -y "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt -y update && sudo apt -y install code

echo -e "Install VSCode Extension Settings Sync\n"
code --install-extension Shan.code-settings-sync

echo -e "Fix error: VSCode is unable to watch for file changes in this large workspace\n"
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

echo -e "Install Sublime Text / Replacement for KWrite\n"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt -y update && sudo apt -y install sublime-text

echo -e "Install Docker\n"
sudo apt -y install docker.io docker-compose

echo -e "Install qView / Replacement for Gwenview\n"
sudo apt -y install qview

echo -e "Install Flameshot / Replacement for Spectacle\n"
sudo apt -y install flameshot

echo -e "Install ULauncher / Replacement for KRunner\n"
sudo apt -y install ulauncher

echo -e "Install Spotify\n"
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt -y update && sudo apt -y install spotify-client

echo -e "Install OBS Studio\n"
sudo apt -y install ffmpeg obs-studio

echo -e "Install Kdenlive\n"
sudo apt -y install kdenlive

echo -e "Install Handbrake\n"
sudo apt -y install handbrake-gtk handbrake-cli

echo -e "Install Krita\n"
sudo apt -y install krita

echo -e "Install Virtualbox\n"
wget -qO - https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo apt-key add -
echo "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
sudo apt -y update && sudo apt -y install virtualbox-6.1

echo -e "Install Discord\n"
wget -cO discord.deb https://discordapp.com/api/download?platform=linux&format=deb
sudo apt -y install ./discord.deb
rm -f discord.deb

echo -e "Install Zoom\n"
wget -cO zoom.deb https://zoom.us/client/latest/zoom_amd64.deb
sudo apt -y install ./zoom.deb
rm -f zoom.deb

echo -e "Install Steam\n"
wget -cO steam.deb http://repo.steampowered.com/steam/archive/precise/steam_latest.deb
sudo apt -y install ./steam.deb
rm -f steam.deb

echo -e "Install Gnome Disk Utility\n"
sudo apt -y install gnome-disk-utility

echo -e "Install Gnome Calculator\n"
sudo apt -y install gnome-calculator

echo -e "Install Disk Usage Analyzer\n"
sudo apt -y install baobab

echo -e "Install Neofetch\n"
sudo apt -y install neofetch

echo -e "Install KDE Partition Manager\n"
sudo apt -y install partitionmanager

echo -e "Install Kvantum Manager\n"
sudo apt -y install qt5-style-kvantum

echo -e "Install Tela Icon Theme\n"
git clone https://github.com/vinceliuice/Tela-icon-theme.git
bash ./Tela-icon-theme/install.sh
rm -rf ./Tela-icon-theme

echo -e "Install Layan KDE Theme\n"
git clone https://github.com/vinceliuice/Layan-kde.git
bash ./Layan-kde/install.sh
rm -rf ./Layan-kde

echo -e "Clear system cache\n"
rm -rf ~/.cache/plasm* ~/.cache/ico*
sudo apt -y clean

echo "The installation was finished"
