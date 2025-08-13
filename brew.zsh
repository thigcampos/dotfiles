#!/bin/zsh

# Exit immediately if a command exits with a non-zero status
set -e

# Colors for pretty output
GREEN="\033[0;32m"
RED="\033[0;31m"
NC="\033[0m" # No Color

echo -e "${GREEN}Checking for Homebrew...${NC}"

# Install Homebrew if not installed
if ! command -v brew >/dev/null 2>&1; then
    echo -e "${GREEN}Homebrew not found. Installing...${NC}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo -e "${GREEN}Homebrew is already installed.${NC}"
fi

echo -e "${GREEN}Updating Homebrew...${NC}"
brew update

echo -e "${GREEN}All done!${NC}"
