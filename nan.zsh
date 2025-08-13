#!/bin/zsh

# Exit on any error
set -e

# Colors for output
GREEN="\033[0;32m"
RED="\033[0;31m"
NC="\033[0m"

echo -e "${GREEN}Checking for Homebrew...${NC}"

# Run brew.zsh if Homebrew is not installed
if ! command -v brew >/dev/null 2>&1; then
    echo -e "${GREEN}Homebrew not found. Running brew.zsh...${NC}"
    if [ -f "$SCRIPT_DIR/brew.zsh" ]; then
        zsh "$SCRIPT_DIR/brew.zsh"
    else
        echo -e "${RED}brew.zsh not found in $SCRIPT_DIR. Aborting.${NC}"
        exit 1
    fi
else
    echo -e "${GREEN}Homebrew is already installed.${NC}"
fi

echo -e "${GREEN}Updating Homebrew...${NC}"
brew update

# Install git-flow
echo -e "${GREEN}Installing git-flow...${NC}"
brew install git-flow-avh

# Install dokku
echo -e "${GREEN}Installing dokku...${NC}"
brew install dokku/repo/dokku

# Install multiple Python versions
for version in 3.10 3.11 3.12 3.13; do
    echo -e "${GREEN}Installing Python ${version}...${NC}"
    brew install python@$version
done

# Install orbstack
echo -e "${GREEN}Installing orbstack...${NC}"
brew install orbstack

echo -e "${GREEN}Installation complete!${NC}"
