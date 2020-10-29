#!/bin/bash

echo -e "Remove packages\n"
sudo apt -y purge firefox kwrite vim kwalletmanager libkf5wallet-bin kde-spectacle gwenview nodejs npm
sudo apt -y autoremove

echo -e "Add PPA's\n"
sudo add-apt-repository -y ppa:jurplel/qview
sudo add-apt-repository -y ppa:agornostal/ulauncher
sudo add-apt-repository -y ppa:obsproject/obs-studio
sudo add-apt-repository -y ppa:stebbins/handbrake-releases
sudo add-apt-repository -y ppa:haraldhv/shotcut
sudo add-apt-repository -y ppa:git-core/ppa

echo -e "Upgrade system\n"
sudo pkcon -y refresh
sudo pkcon -y update
sudo apt -y update
sudo apt -y dist-upgrade

echo -e "Install drivers\n"
sudo ubuntu-drivers install

echo -e "Install packages\n"
sudo apt -y install software-properties-common apt-transport-https libsdl2-dev curl wget

echo -e "Download and install Google Chrome / Replacement for Firefox\n"
wget -cO google-chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome.deb
sudo apt -y install -f

echo -e "Install Git\n"
sudo apt -y install git
echo -e "Do not forget to config your git"
echo -e "git config --global user.name \"Your name\""
echo -e "git config --global user.email your@email.com"
echo -e "Also do not forget to generate an ssh key: ssh-keygen -t rsa -C \"your@email.com\"\n"

echo -e "Install PHP\n"
sudo apt -y install php7.4 php7.4-common php7.4-bcmath php7.4-json php7.4-mbstring php7.4-xml php7.4-zip php7.4-curl openssl

echo -e "Install Composer\n"
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/bin --filename=composer
export PATH="$PATH:$HOME/.config/composer/vendor/bin"

echo -e "Install Laravel Installer\n"
composer global require laravel/installer

echo -e "Install PHP CS Fixer\n"
composer global require friendsofphp/php-cs-fixer

echo -e "Install Nodejs and NPM\n"
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
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

echo -e "Install Shotcut\n"
sudo apt -y install shotcut

echo -e "Install Handbrake\n"
sudo apt -y install handbrake-gtk handbrake-cli

echo -e "Install Virtualbox\n"
wget -cO virtualbox.deb https://download.virtualbox.org/virtualbox/6.1.16/virtualbox-6.1_6.1.16-140961~Ubuntu~eoan_amd64.deb
sudo dpkg -i virtualbox.deb
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
wget -qO- https://raw.githubusercontent.com/vinceliuice/Tela-icon-theme/master/install.sh | DESTDIR="$HOME/.local/share/icons" sh

echo -e "Install Layan KDE Theme\n"
mkdir ~/.local/share/themes
cd ~/.local/share/themes
git clone https://github.com/vinceliuice/Layan-kde.git
cd Layan-kde
sudo bash install.sh

echo -e "Clear system cache\n"
rm -rf ~/.cache/plasm* ~/.cache/ico*
sudo apt -y clean

echo "The installation was finished"
