#!/bin/bash

echo -e "Install Zsh\n"
sudo apt -y install zsh

echo -e "Install Zap zsh\n"
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1

plug "zsh-users/zsh-autosuggestions"
#plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "spaceship-prompt/spaceship-prompt"
