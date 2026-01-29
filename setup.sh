#!/bin/bash

# This is meant to be ran by auto-installers for Dotfiles i.e. Github Codespaces, Coder, Devcontainers, etc.
# It will install chezmoi if not present, then initialize and apply the dotfiles from the cloned repository.

# Get the directory where this script is located (the cloned repo)
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Install chezmoi if not already installed
if ! command -v chezmoi &> /dev/null; then
  cd "$HOME"
  sh -c "$(curl -fsLS get.chezmoi.io/lb)"
fi

# Apply dotfiles and scripts from the repo
~/.local/share/bin/chezmoi init --source="$DOTFILES_DIR" --apply --dry-run --verbose
