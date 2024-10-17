#!/bin/sh

curl -L https://github.com/DavHau/nix-portable/releases/latest/download/nix-portable-$(uname -m) >./nix-portable

# if .nix-portable is not executable, make it executable
if [ ! -x ./nix-portable ]; then
    chmod +x ./nix-portable
fi
