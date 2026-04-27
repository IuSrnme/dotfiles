#!/bin/bash
# Kessoku dotfiles backup script

DOTFILES=~/dotfiles

# Copy configs
cp ~/.config/i3/config $DOTFILES/.config/i3/
cp ~/.config/kitty/kitty.conf $DOTFILES/.config/kitty/
cp ~/.config/picom/picom.conf $DOTFILES/.config/picom/
cp ~/.config/polybar/config.ini $DOTFILES/.config/polybar/
cp ~/.config/polybar/launch.sh $DOTFILES/.config/polybar/
cp ~/.config/rofi/config.rasi $DOTFILES/.config/rofi/
cp ~/.config/rofi/kessoku.rasi $DOTFILES/.config/rofi/
cp ~/.config/dunst/dunstrc $DOTFILES/.config/dunst/
cp ~/.config/fastfetch/config.jsonc $DOTFILES/.config/fastfetch/
cp -r ~/.config/nvim/ $DOTFILES/.config/
cp ~/.config/btop/btop.conf $DOTFILES/.config/btop/
cp -r ~/.config/btop/themes/ $DOTFILES/.config/btop/
cp ~/.zshrc $DOTFILES/

# Push to github
cd $DOTFILES
git add .
git commit -m "dotfiles update $(date '+%Y-%m-%d %H:%M')"
git push

echo "Dotfiles backed up and pushed."
