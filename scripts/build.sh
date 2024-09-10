#!/bin/sh
pushd $HOME/.dotfiles
    # Generate hardware-config for system
    sudo nixos-generate-config --show-hardware-config > hardware-configuration.nix
    # Build system
    sudo nixos-rebuild build --flake .
    # Prompt user if they want to switch 
    read -p "Switch to this build? (y/n) " yn
    case $yn in 
	    y ) echo switching...;
		  sudo nixos-rebuild switch --flake .;;
	    n ) echo exiting...;
		    exit;;
	    *) echo not a valid response;
		    exit 1;;
    esac
    rm result
popd
