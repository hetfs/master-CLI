#!/bin/bash

set -e

install_neovim() {
  echo "Installing Neovim..."
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sudo apt-get update
    sudo apt-get install -y neovim
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install neovim
  elif [[ "$OSTYPE" == "msys" ]]; then
    choco install neovim
  fi
}

install_git() {
  echo "Installing Git..."
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sudo apt-get install -y git
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install git
  elif [[ "$OSTYPE" == "msys" ]]; then
    choco install git
  fi
}

install_nerd_fonts() {
  echo "Installing Nerd Fonts..."
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sudo apt-get install -y fonts-firacode
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew tap homebrew/cask-fonts
    brew install --cask font-fira-code
  elif [[ "$OSTYPE" == "msys" ]]; then
    scoop bucket add nerd-fonts
    scoop install FiraCode-NF
  fi
}

install_lazy_git() {
  echo "Installing LazyGit..."
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sudo apt-get install -y lazygit
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install lazygit
  elif [[ "$OSTYPE" == "msys" ]]; then
    choco install lazygit
  fi
}

setup_lazyvim() {
  echo "Setting up LazyVim..."
  # Backup existing Neovim configurations
  mv ~/.config/nvim ~/.config/nvim.bak || true
  mv ~/.local/share/nvim ~/.local/share/nvim.bak || true

  # Clone LazyVim starter config
  git clone https://github.com/LazyVim/starter ~/.config/nvim

  # Remove .git folder to allow user customization
  rm -rf ~/.config/nvim/.git

  echo "LazyVim setup complete! Run 'nvim' to start."
}

main() {
  install_neovim
  install_git
  install_nerd_fonts
  install_lazy_git
  setup_lazyvim
}

main
