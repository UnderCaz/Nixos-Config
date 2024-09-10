#!/bin/sh

pushd $HOME
  mkdir .dotfiles
  cd .dotfiles
  rm -rf ./*
  
  nix-shell -p git --command "git clone https://github.com/UnderCaz/Nixos-Config ."
popd
 

