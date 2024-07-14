#!/bin/bash

# Description

# HETFS LTD. presents a versatile Bash script to simplify the setup and management of Neovim configurations.
# This script, available at [GitHub - hetfs/master-cli](https://github.com/hetfs/master-cli.git), includes:
# 1. **OS Detection**: Automatically identifies the operating system (Linux, Mac, or Windows) and Linux distributions (Debian or Arch).
# 2. **Configuration Backup**: Backs up existing Neovim configurations, local share, state, and cache directories with a timestamp.
# 3. **Neovim Installation/Update**: Installs Neovim if not already present, or updates it based on the operating system and distribution.
# 4. **Distribution Setup**: Allows selection from popular Neovim distributions (LazyVim, OMAKUB, KickStart, SpaceVim, NormalNvim, NvChad, LunarVim) and sets up the chosen one by cloning the corresponding repository.

# This script is ideal for developers looking to automate and customize their Neovim environment quickly and efficiently.
## 🌐 Sources [github.com - hetfs/master-cli](https://github.com/hetfs/master-cli.git)


# Function to detect the operating system
detect_os() {
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        OS="Linux"
        if command -v apt-get &> /dev/null; then
            DISTRO="Debian"
        elif command -v pacman &> /dev/null; then
            DISTRO="Arch"
        else
            DISTRO="Unknown"
        fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        OS="Mac"
    elif [[ "$OSTYPE" == "msys" ]]; then
        OS="Windows"
    else
        echo "Unsupported OS: $OSTYPE"
        exit 1
    fi
    echo "Detected OS: $OS ($DISTRO)"
}

# Function to back up existing Neovim configuration
backup_config() {
    TIMESTAMP=$(date +%Y%m%d%H%M%S)
    CONFIG_DIR="$HOME/.config/nvim"
    LOCAL_SHARE_DIR="$HOME/.local/share/nvim"
    LOCAL_STATE_DIR="$HOME/.local/state/nvim"
    CACHE_DIR="$HOME/.cache/nvim"

    if [ -d "$CONFIG_DIR" ]; then
        mv "$CONFIG_DIR" "$HOME/.config/nvim_backup_$TIMESTAMP"
        echo "Backed up existing Neovim configuration to $HOME/.config/nvim_backup_$TIMESTAMP"
    fi

    if [ -d "$LOCAL_SHARE_DIR" ]; then
        mv "$LOCAL_SHARE_DIR" "$HOME/.local/share/nvim_backup_$TIMESTAMP"
        echo "Backed up existing Neovim local share to $HOME/.local/share/nvim_backup_$TIMESTAMP"
    fi

    if [ -d "$LOCAL_STATE_DIR" ]; then
        mv "$LOCAL_STATE_DIR" "$HOME/.local/state/nvim_backup_$TIMESTAMP"
        echo "Backed up existing Neovim local state to $HOME/.local/state/nvim_backup_$TIMESTAMP"
    fi

    if [ -d "$CACHE_DIR" ]; then
        mv "$CACHE_DIR" "$HOME/.cache/nvim_backup_$TIMESTAMP"
        echo "Backed up existing Neovim cache to $HOME/.cache/nvim_backup_$TIMESTAMP"
    fi
}

# Function to install or update Neovim
install_neovim() {
    if command -v nvim &> /dev/null; then
        echo "Neovim is already installed. Checking for updates..."
        if [ "$OS" == "Linux" ]; then
            if [ "$DISTRO" == "Debian" ]; then
                sudo apt-get update
                sudo apt-get upgrade -y neovim
            elif [ "$DISTRO" == "Arch" ]; then
                sudo pacman -Syu neovim
            fi
        elif [ "$OS" == "Mac" ]; then
            brew upgrade neovim
        elif [ "$OS" == "Windows" ]; then
            winget upgrade neovim
        fi
    else
        echo "Installing Neovim..."
        if [ "$OS" == "Linux" ]; then
            if [ "$DISTRO" == "Debian" ]; then
                sudo apt-get update
                sudo apt-get install -y neovim
            elif [ "$DISTRO" == "Arch" ]; then
                sudo pacman -S neovim
            fi
        elif [ "$OS" == "Mac" ]; then
            brew install neovim
        elif [ "$OS" == "Windows" ]; then
            winget install neovim
        fi
    fi
    echo "Neovim installed or updated successfully."
}

# Function to clone and set up a Neovim distribution
setup_distribution() {
    DISTRO_URL="$1"
    git clone "$DISTRO_URL" "$HOME/.config/nvim"
    echo "Set up Neovim distribution from $DISTRO_URL"
}

# Prompt user for input
echo "Select a Neovim distribution to install:"
echo "1. LazyVim"
echo "2. OMAKUB"
echo "3. KickStart"
echo "4. SpaceVim"
echo "5. NormalNvim"
echo "6. NvChad"
echo "7. LunarVim"
echo "8. AstroNvim"
read -p "Enter the number of your choice: " choice

# Mapping user input to distribution URLs
case $choice in
    1) DISTRO_URL="https://github.com/LazyVim/LazyVim" ;;
    2) DISTRO_URL="https://github.com/basecamp/omakub" ;;
    3) DISTRO_URL="https://github.com/nvim-lua/kickstart.nvim" ;;
    4) DISTRO_URL="https://github.com/SpaceVim/SpaceVim" ;;
    5) DISTRO_URL="https://github.com/NormalNvim/NormalNvim" ;;
    6) DISTRO_URL="https://github.com/NvChad/NvChad" ;;
    7) DISTRO_URL="https://github.com/lunarvim/lunarvim" ;;
    8) DISTRO_URL="https://github.com/AstroNvim/AstroNvim" ;;
    *) echo "Invalid choice. Exiting."; exit 1 ;;
esac

# Execute functions
detect_os
backup_config
install_neovim
setup_distribution "$DISTRO_URL"

echo "Neovim setup completed successfully."