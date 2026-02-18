#!/bin/bash
set -e

echo "Installing dev tools..."

# Install fzf
if [ ! -d "$HOME/.fzf" ]; then
  echo "Installing fzf..."
  git clone --depth 1 https://github.com/junegunn/fzf.git "$HOME/.fzf"
  "$HOME/.fzf/install" --all
else
  echo "fzf already installed"
fi

# Install tmux plugin manager
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  echo "Installing tmux plugin manager..."
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
else
  echo "tpm already installed"
fi

# Install asdf binary
if [ ! -f "$HOME/.local/bin/asdf" ]; then
  echo "Installing asdf..."

  # Download latest binary
  ASDF_VERSION=$(curl -s https://api.github.com/repos/asdf-vm/asdf/releases/latest | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/')
  OS=$(uname -s)
  ARCH=$(uname -m | sed 's/x86_64/amd64/')

  curl -sL "https://github.com/asdf-vm/asdf/releases/download/${ASDF_VERSION}/asdf-${ASDF_VERSION}-${OS}-${ARCH}.tar.gz" \
    | tar -xz -C /tmp

  mkdir -p "$HOME/.local/bin"
  mv /tmp/asdf "$HOME/.local/bin/asdf"
  chmod +x "$HOME/.local/bin/asdf"

  echo "asdf ${ASDF_VERSION} installed!"
else
  echo "asdf already installed"
fi
