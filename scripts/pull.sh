#!/bin/sh
pushd /home/$(whoami)/.dotfiles
  nix-shell -p git --command "git pull https://github.com/UnderCaz/Nixos-Config"
popd
