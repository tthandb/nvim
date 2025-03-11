#!/bin/bash

echo "Installing NVIM"
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage
./nvim-linux-x86_64.appimage --appimage-extract
mkdir -p /opt/nvim
mv nvim-linux-x86_64.appimage /opt/nvim/nvim

# Function to check and install apt package
install_apt_package() {
    local package_name=$1
    if ! command -v "$package_name" &> /dev/null; then
        echo "$package_name is not installed. Installing $package_name..."
        sudo apt update
        sudo apt install -y "$package_name"
        echo "$package_name has been installed."
    else
        echo "$package_name is already installed."
    fi
}

# Function to check and install npm package
install_npm_package() {
    local package_name=$1
    if ! npm list -g "$package_name" &> /dev/null; then
        echo "$package_name is not installed. Installing $package_name..."
        sudo npm install -g "$package_name"
        echo "$package_name has been installed."
    else
        echo "$package_name is already installed."
    fi
}

# Array of apt packages to install
apt_packages=(
    "gcc"
    "npm"
    "ripgrep"
)

# Array of npm packages to install
npm_packages=(
    "typescript"
    "typescript-language-server"
    "bash-language-server"
    "@tailwindcss/language-server"
    "vscode-langservers-extracted"
)

# Install apt packages
for package in "${apt_packages[@]}"; do
    install_apt_package "$package"
done

# Install npm packages
for package in "${npm_packages[@]}"; do
    install_npm_package "$package"
done
