#!/bin/bash
set -e

FISH_PATH=$(command -v fish 2>/dev/null || echo "")

if [ -z "$FISH_PATH" ]; then
  echo "⚠️  Fish shell not found. Skipping shell change."
  exit 0
fi

if [ "$SHELL" != "$FISH_PATH" ]; then
  echo "Changing default shell to fish..."
  sudo chsh -s "$FISH_PATH" "$USER"
  echo "✓ Shell changed to fish. Log out and back in for this to take effect."
else
  echo "✓ Default shell is already fish"
fi
