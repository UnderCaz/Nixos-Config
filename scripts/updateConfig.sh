#!/bin/sh

pushd /home/$(whoami)/.dotfiles
  nix-shell -p git --command "git pull https://github.com/UnderCaz/Nixos-Config.git"
  sudo nixos-rebuild build --flake .

  # remove link
  rm result
  # prompt to switch to build
  read -p "Do you want to switch to this build? " -n 1 -r 
  if [[ ! $REPLY =~ ^[Yy]$ ]]
  then 
	  exit 1
  else
	  sudo nixos-rebuild switch --flake .
  fi
popd
