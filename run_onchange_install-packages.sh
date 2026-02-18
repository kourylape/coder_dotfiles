#!/bin/bash

sudo mkdir -p /etc/apt/keyrings

# eza
if ! [ -f /etc/apt/keyrings/gierens.gpg ]; then
  wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
  echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
fi

# fastfetch
sudo add-apt-repository ppa:zhangsongcui3371/fastfetch

sudo apt update

sudo apt install -y \
  curl \
  wget \
  fish \
  btop \
  fastfetch \
  bat \
  ripgrep \
  gpg \
  tmux
