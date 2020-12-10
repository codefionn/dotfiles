#!/usr/bin/env bash
cd $(dirname $0)
[ -d ./user ]  || mkdir ./user

cp -v $HOME/{.bashrc,.bash_profile,.vimrc} ./user/

[ -d  ./user/.config ] || mkdir ./.config
cp -vr $HOME/.config/sway ./user/.config/
cp -vr $HOME/.config/alacritty ./user/.config/

[ -d system ] || mkdir system
