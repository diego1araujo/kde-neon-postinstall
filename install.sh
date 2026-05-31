#!/bin/bash

echo "What's your git name?"
read git_name

echo "What's your git email?"
read git_email

echo -e "Add PPA's\n"
sudo add-apt-repository -y ppa:jurplel/qview
sudo add-apt-repository -y ppa:obsproject/obs-studio
sudo add-apt-repository -y ppa:git-core/ppa
sudo add-apt-repository -y ppa:ondrej/php
sudo add-apt-repository -y ppa:zhangsongcui3371/fastfetch

echo -e "Upgrade system\n"
sudo apt update && sudo apt -y upgrade

# Create file to fix packages cache update
sudo touch /var/lib/man-db/auto-update

# echo -e "Install Nvidia drivers\n"
# sudo ubuntu-drivers install

echo -e "Install packages\n"
sudo apt -y install software-properties-common apt-transport-https ca-certificates libsdl2-dev curl wget gpg gnupg openssl gnome-keyring zip unzip

echo -e "Install Zsh\n"
sudo apt -y install zsh

echo -e "Install Zap zsh / Replacement for oh-my-zsh\n"
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1

echo -e "Download and install Brave Browser\n"
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update && sudo apt -y install brave-browser

echo -e "Download and install Librewolf\n"
sudo apt update && sudo apt -y install extrepo
sudo extrepo enable librewolf
sudo apt update && sudo apt -y install librewolf

echo -e "Install Git\n"
sudo apt -y install git
git config --global user.name "$git_name"
git config --global user.email $git_email
git config --global init.defaultBranch main
git config --global push.autoSetupRemote true
git config --global core.autocrlf false
git config --global fetch.prune true
git config --global --add safe.directory "*"
ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa -C $git_email

echo e- "Install dependencies for PHP\n"
sudo apt -y install network-manager libnss3-tools jq xsel

echo -e "Install PHP\n"
sudo apt -y install php8.5-fpm php8.5-cli php8.5-{common,bcmath,mbstring,xml,mysql,zip,curl,apcu,pdo,sqlite3,redis,intl,gd}

echo -e "Install MariaDB\n"
sudo apt -y install mariadb-server

echo -e "Install Composer\n"
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
echo 'export PATH="$PATH:$HOME/.config/composer/vendor/bin"' >> ~/.bashrc
source ~/.bashrc

echo -e "Install Bun\n"
curl -fsSL https://bun.sh/install | bash

echo -e "Install Nodejs and NPM\n"
curl -sL https://deb.nodesource.com/setup_24.x | sudo -E bash -
sudo apt -y install nodejs

echo -e "Install Visual Studio Code\n"
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/keyrings/microsoft.gpg > /dev/null
echo 'Types: deb
URIs: https://packages.microsoft.com/repos/code
Suites: stable
Components: main
Architectures: amd64 arm64 armhf
Signed-By: /etc/apt/keyrings/microsoft.gpg' | sudo tee /etc/apt/sources.list.d/vscode.sources
sudo apt update && sudo apt -y install code

echo -e "Fix error: VSCode is unable to watch for file changes in this large workspace\n"
echo "fs.inotify.max_user_watches = 524288" | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

echo -e "Install Sublime Text\n"
sudo wget -O- https://download.sublimetext.com/sublimehq-pub.gpg | sudo gpg --dearmor | sudo tee /usr/share/keyrings/sublimehq-archive-keyring.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/sublimehq-archive-keyring.gpg] https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update && sudo apt -y install sublime-text

echo -e "Install Docker\n"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt -y update && sudo apt -y install docker-ce

echo -e "Install qView / Replacement for Gwenview\n"
sudo apt -y install qview

echo -e "Install Flameshot / Replacement for Spectacle\n"
sudo apt -y install flameshot

echo -e "Install OBS Studio\n"
sudo apt -y install ffmpeg obs-studio

echo -e "Install Kdenlive\n"
sudo apt -y install kdenlive

echo -e "Install Krita\n"
sudo apt -y install krita

echo -e "Install Inkscape\n"
sudo apt -y install inkscape

echo -e "Install KDE Partition Manager\n"
sudo apt -y install partitionmanager

echo -e "Install KColorChooser\n"
sudo apt -y install kcolorchooser

echo -e "Install Gnome Disk Utility\n"
sudo apt -y install gnome-disk-utility

echo -e "Install Gnome Calculator\n"
sudo apt -y install gnome-calculator

echo -e "Install Disk Usage Analyzer\n"
sudo apt -y install baobab

echo -e "Install Neofetch\n"
sudo apt -y install neofetch

echo -e "Install Fastfetch\n"
sudo apt -y install fastfetch

echo -e "Install KDE KSysGuard\n"
sudo apt -y install ksysguard

echo -e "Install Kvantum Manager\n"
sudo apt -y install qt5-style-kvantum

echo -e "Install CPU-X\n"
sudo apt -y install cpu-x

echo -e "Install Htop\n"
sudo apt -y install htop

echo -e "Install Btop\n"
sudo apt -y install btop

echo -e "Enable Flatpak\n"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo -e "Install VSCode\n"
flatpak -y --noninteractive install flathub com.visualstudio.code

echo -e "Install Planify\n"
flatpak -y --noninteractive install flathub io.github.alainm23.planify

echo -e "Install Gnome Boxes\n"
flatpak -y --noninteractive install flathub org.gnome.Boxes

echo -e "Install Haruna Player\n"
flatpak -y --noninteractive install flathub org.kde.haruna

echo -e "Install Firefox\n"
flatpak -y --noninteractive install flathub org.mozilla.firefox

echo -e "Install Chromium\n"
flatpak -y --noninteractive install flathub org.chromium.Chromium

echo -e "Install Krita\n"
flatpak -y --noninteractive install flathub org.kde.krita

echo -e "Install Inkscape\n"
flatpak -y --noninteractive install flathub org.inkscape.Inkscape

echo -e "Install Kdenlive\n"
flatpak -y --noninteractive install flathub org.kde.kdenlive

echo -e "Install OBS Studio\n"
flatpak -y --noninteractive install flathub com.obsproject.Studio

echo -e "Install Handbrake\n"
flatpak -y --noninteractive install flathub fr.handbrake.ghb

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

echo -e "Install Telegram\n"
flatpak -y --noninteractive install flathub org.telegram.desktop

echo -e "Install Simplenote\n"
flatpak -y --noninteractive install flathub com.simplenote.Simplenote

echo -e "Install Beekeeper Studio\n"
flatpak -y --noninteractive install flathub io.beekeeperstudio.Studio

echo -e "Install Sleek\n"
flatpak -y --noninteractive install flathub com.github.ransome1.sleek

echo -e "Install Obsidian\n"
flatpak -y --noninteractive install flathub md.obsidian.Obsidian

echo -e "Install Antares SQL\n"
flatpak -y --noninteractive install flathub it.fabiodistasio.AntaresSQL

echo -e "Install Bruno API Client\n"
flatpak -y --noninteractive install flathub com.usebruno.Bruno

echo -e "Install Gnome Calculator\n"
flatpak -y --noninteractive install org.gnome.Calculator

echo -e "Install Layan KDE Theme\n"
git clone https://github.com/vinceliuice/Layan-kde.git
bash ./Layan-kde/install.sh
rm -rf ./Layan-kde

echo -e "Clear system cache\n"
rm -rf ~/.cache/plasm* ~/.cache/ico*
sudo apt -y clean
sudo apt -y autoclean
sudo apt -y autoremove

echo "The installation was finished"
