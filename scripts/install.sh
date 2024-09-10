#!/bin/sh

pushd $HOME
  rm -rf ./.dotfiles
  mkdir .dotfiles
  cd .dotfiles
  
  nix-shell -p git --command "git clone https://github.com/UnderCaz/Nixos-Config ."
popd
 

