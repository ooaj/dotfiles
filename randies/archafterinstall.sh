#!/usr/bin/env bash

# Check for missing packages. Add them later.
# Fix dotfiles/config.
# Add fish.

function info {
	printf "Info: %s\n" "${*}"
}

info "Installing core packages."

core_pkgs=(
            hexchat
            mpv
            feh
            xclip
            rxvt-unicode
            fish
            vim 
            thunar
            firefox
            thunderbird
            git
            lxappearance
            yay
            i3-gaps
            i3blocks
            i3lock
            jupyter-notebook
            keepassx
            adapta-gtk-theme
            awesome-terminal-fonts
            evince
            mupdf
            octave
            qutebrowser
            qbittorrent
            steam
            terminus-font
            tamsyn-font
            ttf-anonymous-pro
            youtube-dl
            pcmanfm
)

aur_pkgs=(
         numix-themes-darkblue
         ttf-enyv-code-r
         visual-studio-code-bin
         spotify
         otf-hack
         papirus-icon-theme-git
         consolas-font
)

yes | sudo pacman -S "${core_pkgs[@]}"

info "Core packages installed. Now, installing yay, an AUR helper"

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..

info "Now installing AUR packages"

yes | sudo yay -S "${aur_pkgs[@]}"

info "Now install Sublime Text 3"

curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg

echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf

yes | sudo pacman -Syu sublime-text

info "Now installing config from previous installation."

read -r -p "Do you want to continue? [y/N]" response
response=${response,,}
echo
if [[ "$response" =~ ^(yes|y)$ ]]
then
    git clone https://github.com/ooaj/dotfiles
else
    [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
fi

    


