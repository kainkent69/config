#!/bin/bash

# Target home directory
TARGET=$HOME

echo "Stowing configurations to $TARGET..."

# Get the directory where the script is located
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DOTFILES_DIR"

# Clean stowing logic for your specific structure
stow --adopt -vt "$TARGET" .config
stow --adopt -vt "$TARGET" .images
stow --adopt -vt "$TARGET" zsh
stow --adopt -vt "$TARGET" tmux
stow --adopt -vt "$TARGET" starship
stow --adopt -vt "$TARGET" hyprland -t "$TARGET/.config/hypr"
stow --adopt -vt "$TARGET" kitty -t "$TARGET/.config/kitty"

echo "All configurations stowed successfully."
