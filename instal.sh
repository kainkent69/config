#!/bin/bash
# set -e
#
# # Configuration
 USER_NAME=guest # user name
#
EXTENSIONS=(
rocketseat.theme-omni
esbenp.prettier-vscode
dbaeumer.vscode-eslint
golang.go
ms-vscode.cmake-tools
steoates.autoimport
)

# # The script begins here.
# pac() {
#   pacman -Sy $1
# }
#
# # Utilities
# pac " noto-fonts-emoji  bashtop bat "
#
#
#
# # Sway & desktop tools
# pac " slurp grim xorg-xwayland "
#
# # Services
# systemctl enable NetworkManager.service
#
# # Environment
# echo "MOZ_ENABLE_WAYLAND=1\nLIBSEAT_BACKEND=logind" > /etc/environment
#
# # Zsh + Oh My Zsh
# # Disabled until I find a way to install it properly, I'm thinking on moving to slimzsh, time will tell.
# # export RUNZSH=no
# # sudo --user=$USER_NAME sh -c "wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"
# # git clone https://github.com/zsh-users/zsh-autosuggestions.git /home/$USER_NAME/.oh-my-zsh/plugins/zsh-autosuggestions
# # git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /home/$USER_NAME/.oh-my-zsh/plugins/zsh-syntax-highlighting
# # sudo --user=$USER_NAME sh -c "chsh -s $(which zsh)"
#
# # Dotfiles symlink farm
cd /home/$USER_NAME/dotfiles
stow --adopt -vt /home/$USER_NAME/. .config
stow --adopt -vt /home/$USER_NAME/.images .images
stow --adopt -vt /home/$USER_NAME zsh

chown -R $USER_NAME /home/$USER_NAME

# VSCode extensions
for i in ${EXTENSIONS[@]}; do
  sudo --user=$USER_NAME sh -c "code --force --install-extension $i"
done

# Git

echo "Script has finished. Please reboot your PC using 'reboot' command."
exit
