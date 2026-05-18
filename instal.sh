#!/bin/bash
set -e

# Configuration
USER_NAME=$USER

EXTENSIONS=(
    rocketseat.theme-omni
    esbenp.prettier-vscode
    dbaeumer.vscode-eslint
    golang.go
    ms-vscode.cmake-tools
    steoates.autoimport
)

# Function to install packages (Arch Linux assumed)
install_pkg() {
    echo "Installing: $1"
    sudo pacman -S --needed --noconfirm $1
}

echo "Updating system..."
sudo pacman -Syu --noconfirm

echo "Installing Core Utilities..."
install_pkg "stow kitty starship bat bashtop noto-fonts-emoji"

echo "Installing Nerd Fonts..."
install_pkg "ttf-meslo-nerd ttf-cascadia-code-nerd ttf-iosevka-nerd ttf-jetbrains-mono-nerd"

echo "Installing Hyprland Ecosystem..."
install_pkg "hyprland hyprpaper hypridle hyprlock waybar wofi hyprshot"
install_pkg "grim slurp wl-clipboard xorg-xwayland"

echo "Configuring Environment..."
sudo sh -c 'echo -e "MOZ_ENABLE_WAYLAND=1\nLIBSEAT_BACKEND=logind" > /etc/environment'

echo "Stowing Dotfiles..."
cd "$(dirname "$0")"

# Use your existing stow script 'b' logic but cleaned up for $HOME
stow --adopt -vt "$HOME" .config
stow --adopt -vt "$HOME" .images
stow --adopt -vt "$HOME" zsh
stow --adopt -vt "$HOME" tmux
stow --adopt -vt "$HOME" starship
stow --adopt -vt "$HOME" hyprland -t "$HOME/.config/hypr"
stow --adopt -vt "$HOME" kitty -t "$HOME/.config/kitty"

echo "Installing VSCode Extensions..."
for i in "${EXTENSIONS[@]}"; do
    code --force --install-extension "$i"
done

echo "Script has finished. Please reboot your PC."
