#!/bin/bash

# Script to install preferred tools

mkdir -p "$HOME/.config"
cp -r nvim "$HOME/.config/nvim"
cp -r tmux "$HOME/.config/tmux"

status=$?
echo "Done: copying, exit status: ${status}"

# Remove old version
sudo apt remove -y neovim

status=$?
echo "Done: removing, exit status: ${status}"

# Fetch latest .deb from neovim‑releases
curl -s https://api.github.com/repos/neovim/neovim-releases/releases/latest \
  | grep "browser_download_url.*nvim-linux-x86_64.deb" \
  | cut -d '"' -f 4 \
  | wget -qi -

status=$?
echo "Done: getting new deb, exit status: ${status}"

# Install it
sudo apt install -y ./nvim-linux-x86_64.deb
status=$?
echo "Done: installing new deb, exit status: ${status}"
rm -f nvim-linux-x86_64.deb
status=$?
echo "Done: removing deb, exit status: ${status}"

# Install remaining tools (build-essential for gcc and make)
sudo apt update
status=$?
echo "Done: updating, exit status: ${status}"
sudo apt install -y build-essential
status=$?
echo "Done: installing essential, exit status: ${status}"
sudo apt install -y tmux ripgrep

status=$?
echo "Done: installing tmux and ripgrep, exit status: ${status}"

