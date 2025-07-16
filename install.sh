#!/bin/bash

# Install the source code
curl https://gravyweb.eng.qumulo.com/home/jwentzien/install_source.sh | bash

# Install preferred tools

mkdir -p "$HOME/.config"
cp -r nvim "$HOME/.config/nvim"
cp -r tmux "$HOME/.config/tmux"

# Remove old version
sudo apt remove -y neovim

# Fetch latest .deb from neovim‑releases
curl -s https://api.github.com/repos/neovim/neovim-releases/releases/latest | grep "browser_download_url.*nvim-linux-x86_64.deb" | cut -d '"' -f 4 | wget -qi -

# Install it
sudo apt install -y ./nvim-linux-x86_64.deb
rm -f nvim-linux-x86_64.deb

# Install remaining tools (build-essential for gcc and make)
sudo apt update
sudo apt install -y build-essential
sudo apt install -y tmux ripgrep

