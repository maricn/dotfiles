#!/bin/bash

cd ~
for i in .bash_history .bash_profile .bashrc .htoprc .mavenrc .pypirc .zsh-update .zshrc .xinitrc .Xmodmap
do
  mv $i $i.backup
  ln -s ~/.dotfiles/$i
done
