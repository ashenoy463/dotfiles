#!/bin/sh
# vim:filetype=sh

# System update and package install
#
sudo pacman -Syu
sudo pacman -S base-devel python python-pip
sudo pacman -R manjaro-zsh-config
pip3 install flake8 neovim autoflake notify-send-py ncm

sudo pacman -S - < packages.txt
pamac build packages_aur.txt


# Config variables
#
USERVDIR="${HOME}/.config/systemd/user"
TEMPDIR="${HOME}/temp"
DOTDIR="${HOME}/dotfiles"
SSH_DIR="${HOME}/.ssh"

# Preliminary setup
#
mkdir -p "${TEMPDIR}"
cd "${HOME}"

git clone https://github.com/masala-man/dotfiles-gibraltar "${DOTDIR}"
#cd "${DOTDIR}"
# LUKEST and BASE16CONSOLE INSTALL


# SSH Keys
#
ssh-keygen -N "" -f "${SSH_DIR}/id_rsa"
ssh-keygen -N "" -f "${SSH_DIR}/github"
ssh-keygen -N "" -f "${SSH_DIR}/gitlab"
ln -s "${DOTDIR}/misc/config" "${HOME}/.ssh/config"
#ssh-copy-id schrodinger


# OMZ and plugins
#
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/wfxr/forgit.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/forgit
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
git clone https://github.com/jeffreytse/zsh-vi-mode $ZSH_CUSTOM/plugins/zsh-vi-mode

ln -s "${DOTDIR}/misc/masalaprompt.zsh-theme" "${HOME}/.oh-my-zsh/themes/masalaprompt.zsh-theme"
ln -s "${DOTDIR}/misc/masalaprompt-ssh.zsh-theme" "${HOME}/.oh-my-zsh/themes/masalaprompt-ssh.zsh-theme"

cp "${DOTDIR}/misc/.profile" "${HOME}"


# Services
#
mkdir -p "${USERVDIR}"

cp "${DOTDIR}/misc/services/batsignal.service" "${USERVDIR}" && systemctl enable --user batsignal
cp "${DOTDIR}/misc/services/syncthing.service" "${USERVDIR}" && systemctl enable --user syncthing
cp "${DOTDIR}/misc/services/wacom.service" "${USERVDIR}" && systemctl enable --user wacom
systemctl enable --user mpd
sudo systemctl enable tlp
sudo systemctl disable gdm.service


# GTK theme install
#
cd "${TEMPDIR}"
git clone https://github.com/dracula/gtk/archive/master.zip
git clone https://github.com/dracula/gtk/files/5214870/Dracula.zip
unar master.zip
unar Dracula.zip
sudo mv Dracula "/usr/share/icons/"
cp -r master/gtk-4.0 "${HOME}/.config/gtk-4.0"
sudo mv master "/usr/share/themes/Dracula"


# Misc and cleanup
#
mkdir "${HOME}/devel"
mkdir "${HOME}/Pictures/Screenshots"

rm ${HOME}/.zshrc # ow stow conflict
rm ${HOME}/.Xresources

sudo rm "/etc/issue"
sudo cp "${DOTDIR}/misc/issue_${HOSTNAME}" "/etc/issue"

rm -rf "${TEMPDIR}"
