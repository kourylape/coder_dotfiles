#!/bin/bash
set -e

# Install neovim from GitHub releases (latest stable)
if [ ! -f "$HOME/.local/bin/nvim" ]; then
  echo "Installing neovim..."

  NVIM_VERSION=$(curl -s https://api.github.com/repos/neovim/neovim/releases/latest | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/')

  curl -sL "https://github.com/neovim/neovim/releases/download/${NVIM_VERSION}/nvim-linux-x86_64.tar.gz" \
    | tar -xz -C /tmp

  mkdir -p "$HOME/.local"
  cp -r /tmp/nvim-linux-x86_64/* "$HOME/.local/"
  rm -rf /tmp/nvim-linux-x86_64

  echo "neovim ${NVIM_VERSION} installed!"
else
  echo "neovim already installed"
fi
