#!/bin/bash

# initialize MSYS2 installation
pacman -Su

# install packages
echo ""
echo "Installing MinGW64 Toolchain"
pacman -S --needed base-devel mingw-w64-x86_64-toolchain

# install unzip, git, cmake
echo ""
echo "Installing Unzip, Git, CMake"
pacman -Sy unzip git cmake

echo ""
echo "Installing RapidJSON"
pacman -Sy mingw-w64-x86_64-rapidjson

# logout
read -p "Press any key to continue..."
logout
