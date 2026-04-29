#!/bin/bash
set -e
# Kessoku dotfiles backup script

DOTFILES=~/dotfiles

mkdir -p "$DOTFILES"/.config/{i3,kitty,picom,polybar,rofi,dunst,fastfetch,nvim,btop,yazi/flavors,mpv,fontconfig,gtk-3.0}

# Copy configs
cp ~/.config/i3/config "$DOTFILES/.config/i3/"
cp ~/.config/kitty/kitty.conf "$DOTFILES/.config/kitty/"
cp ~/.config/picom/picom.conf "$DOTFILES/.config/picom/"
cp ~/.config/polybar/config.ini "$DOTFILES/.config/polybar/"
cp ~/.config/polybar/launch.sh "$DOTFILES/.config/polybar/"
cp ~/.config/rofi/config.rasi "$DOTFILES/.config/rofi/"
cp ~/.config/rofi/kessoku.rasi "$DOTFILES/.config/rofi/"
cp ~/.config/dunst/dunstrc "$DOTFILES/.config/dunst/"
cp ~/.config/fastfetch/config.jsonc "$DOTFILES/.config/fastfetch/"
cp -r ~/.config/nvim/ "$DOTFILES/.config/"
cp ~/.config/btop/btop.conf "$DOTFILES/.config/btop/"
cp -r ~/.config/btop/themes/ "$DOTFILES/.config/btop/"
cp ~/.zshrc "$DOTFILES/"
cp ~/.xprofile "$DOTFILES/"
cp ~/.config/yazi/yazi.toml "$DOTFILES/.config/yazi/"
cp -r ~/.config/yazi/flavors/ "$DOTFILES/.config/yazi/"
cp ~/.config/yazi/theme.toml "$DOTFILES/.config/yazi/"
cp ~/.config/mpv/mpv.conf "$DOTFILES/.config/mpv/"
cp ~/.config/fontconfig/fonts.conf "$DOTFILES/.config/fontconfig/"
cp ~/.config/gtk-3.0/settings.ini "$DOTFILES/.config/gtk-3.0/"
cp ~/.config/fastfetch/bocchi.txt "$DOTFILES/.config/fastfetch"
cp -r ~/.config/easyeffects/ "$DOTFILES/.config/easyeffects/"
cp -r ~/.config/copyq/ "$DOTFILES/.config/copyq/"
cp -r ~/.config/fcitx5/ "$DOTFILES/.config/fcitx5/"
cp -r ~/.cache/paru/clone/rofi-themes-collection-git/src/rofi-themes-collection/themes/template/rounded-template.rasi "$DOTFILES/.config/rofi/"

# Push to github
cd "$DOTFILES"
git add .
git commit -m "$(hostname) - dotfiles update $(date '+%Y-%m-%d %H:%M')"
git push

echo "Dotfiles backed up and pushed."
