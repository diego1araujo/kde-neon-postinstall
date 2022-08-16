#!/bin/bash

echo "What's your git name?"
read git_name

echo "What's your git email?"
read git_email

echo -e "Remove packages\n"
sudo apt -y purge firefox kwrite vim kwalletmanager libkf5wallet-bin kde-spectacle gwenview okular plasma-systemmonitor
sudo apt -y autoremove

echo -e "Add PPA's\n"
sudo add-apt-repository -y ppa:jurplel/qview
sudo add-apt-repository -y ppa:obsproject/obs-studio
sudo add-apt-repository -y ppa:stebbins/handbrake-releases
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

echo -e "Download and install Brave Browser / Replacement for Firefox\n"
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt -y update && sudo apt -y install brave-browser

echo -e "Download and install Microsoft Edge / Replacement for Firefox\n"
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-dev.list'
sudo rm microsoft.gpg
sudo apt -y update && sudo apt -y install microsoft-edge-stable

echo -e "Install Git\n"
sudo apt -y install git
git config --global user.name "$git_name"
git config --global user.email $git_email
git config --global init.defaultBranch main
git config --global push.autoSetupRemote true
git config --global --add safe.directory "*"
ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa -C $git_email

echo e- "Install dependencies for PHP\n"
sudo apt -y install network-manager libnss3-tools jq xsel

echo -e "Install PHP\n"
sudo apt -y install php8.1-fpm php8.1-cli php8.1-{common,bcmath,mbstring,xml,mysql,zip,curl,opcache,pdo,ctype,tokenizer,fileinfo,sqlite3,redis}

echo -e "Install MySQL\n"
sudo apt -y install mysql-server

echo -e "Install Composer\n"
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
echo 'export PATH="$PATH:$HOME/.config/composer/vendor/bin"' >> ~/.bashrc
source ~/.bashrc

echo -e "Install Nodejs and NPM\n"
curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -
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

echo -e "Install OBS Studio\n"
sudo apt -y install ffmpeg obs-studio

echo -e "Install Handbrake\n"
sudo apt -y install handbrake-gtk handbrake-cli

echo -e "Install Virtualbox\n"
wget -qO - https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo apt-key add -
echo "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
sudo apt -y update && sudo apt -y install virtualbox-6.1

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

echo -e "Install KDE KSysGuard\n"
sudo apt -y install ksysguard

echo -e "Install Kvantum Manager\n"
sudo apt -y install qt5-style-kvantum

echo -e "Enable Flatpak\n"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak update

echo -e "Install Flatseal\n"
flatpak -y --noninteractive install flathub com.github.tchx84.Flatseal

echo -e "Install Krita\n"
flatpak -y --noninteractive install flathub org.kde.krita

echo -e "Install Inkscape\n"
flatpak -y --noninteractive install flathub org.inkscape.Inkscape

echo -e "Install Kdenlive\n"
flatpak -y --noninteractive install flathub org.kde.kdenlive

echo -e "Install Mailspring\n"
flatpak -y --noninteractive install flathub com.getmailspring.Mailspring

echo -e "Install Spotify\n"
flatpak -y --noninteractive install flathub com.spotify.Client

echo -e "Install Steam\n"
flatpak -y --noninteractive install flathub com.valvesoftware.Steam

echo -e "Install Zoom\n"
flatpak -y --noninteractive install flathub us.zoom.Zoom

echo -e "Install Discord\n"
flatpak -y --noninteractive install flathub com.discordapp.Discord

echo -e "Install Bitwarden\n"
flatpak -y --noninteractive install flathub com.bitwarden.desktop

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
flatpak update
sudo apt -y clean
sudo apt -y autoclean
sudo apt -y autoremove

echo "The installation was finished"
