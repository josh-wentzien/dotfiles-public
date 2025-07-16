#!/bin/bash

# Script to install preferred tools

mkdir -p "$HOME/.config"
cp -r nvim "$HOME/.config/nvim"
cp -r tmux "$HOME/.config/tmux"

sudo apt remove -y neovim
sudo add-apt-repository ppa:neovim-ppa/stable -y
sudo apt update
sudo apt install -y neovim tmux ripgrep
