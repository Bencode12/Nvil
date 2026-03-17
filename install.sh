#!/bin/bash

# NVIM Installation Script for Nvil Configuration
# This script installs Neovim and all required dependencies

set -e  # Exit on error

echo "🚀 Starting Nvil Installation..."
echo "================================"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored messages
print_info() {
    echo -e "${GREEN}✓${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

# Detect OS
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    print_info "Detected Linux system"
    
    # Check if Debian/Ubuntu-based
    if command -v apt-get &> /dev/null; then
        print_info "Debian/Ubuntu-based system detected"
        
        # Add Neovim PPA
        print_info "Adding Neovim PPA..."
        sudo add-apt-repository -y ppa:neovim-ppa/unstable
        
        # Update package lists
        print_info "Updating package lists..."
        sudo apt-get update
        
        # Install Neovim and dependencies
        print_info "Installing Neovim and dependencies..."
        sudo apt-get install -y neovim
        sudo apt-get install -y ripgrep
        sudo apt-get install -y fzf
        sudo apt-get install -y fd-find
        sudo apt-get install -y lua5.3
        sudo apt-get install -y nodejs npm
        sudo apt-get install -y gcc
        sudo apt-get install -y python3-pip
        sudo apt-get install -y zip unzip curl git
        
        # Install Python support for Neovim
        print_info "Installing Python support..."
        pip3 install pynvim
        
    # Check if Arch-based
    elif command -v pacman &> /dev/null; then
        print_info "Arch-based system detected"
        
        sudo pacman -Sy --noconfirm neovim
        sudo pacman -S --noconfirm ripgrep fzf fd nodejs npm python-pip
        pip3 install pynvim
        
    # Check if Fedora/RHEL-based
    elif command -v dnf &> /dev/null; then
        print_info "Fedora/RHEL-based system detected"
        
        sudo dnf install -y neovim
        sudo dnf install -y ripgrep fzf fd-find nodejs npm
        sudo dnf install -y gcc python3-pip
        pip3 install pynvim
    else
        print_warning "Unsupported Linux distribution. Installing minimal packages..."
        sudo apt-get update || true
        sudo apt-get install -y neovim ripgrep fzf fd-find nodejs npm python3-pip
    fi
    
elif [[ "$OSTYPE" == "darwin"* ]]; then
    print_info "Detected macOS system"
    
    # Check if Homebrew is installed
    if ! command -v brew &> /dev/null; then
        print_error "Homebrew not found. Please install it first: https://brew.sh"
        exit 1
    fi
    
    print_info "Installing Neovim and dependencies via Homebrew..."
    brew install neovim
    brew install ripgrep fzf fd nodejs
    pip3 install pynvim
    
else
    print_error "Unsupported operating system: $OSTYPE"
    exit 1
fi

# Install Rust (for some plugins)
print_info "Checking Rust installation..."
if ! command -v rustc &> /dev/null; then
    print_info "Installing Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source $HOME/.cargo/env
else
    print_info "Rust already installed"
fi

# Setup Neovim configuration directory
print_info "Setting up Neovim configuration..."
mkdir -p ~/.config/nvim

# Backup existing config if exists
if [ -d ~/.config/nvim_backup ]; then
    print_warning "Backup directory already exists, removing old backup..."
    rm -rf ~/.config/nvim_backup
fi

if [ "$(ls -A ~/.config/nvim)" ]; then
    print_warning "Backing up existing Neovim configuration..."
    mv ~/.config/nvim ~/.config/nvim_backup
fi

# Clone Nvil repository
print_info "Cloning Nvil configuration..."
git clone https://github.com/Bencode12/Nvil.git ~/.config/nvim

print_info "Installation completed successfully! 🎉"
echo ""
echo "#############################################"
echo "#                                           #"
echo "#         NVIL SETUP COMPLETED! 🎉          #"
echo "#                                           #"
echo "#############################################"
echo "# You can now start Neovim with the command #"
echo "#               'nvim'                      #"
echo "#############################################"
echo ""
print_warning "Your previous config has been backed up to ~/.config/nvim_backup"
echo ""
