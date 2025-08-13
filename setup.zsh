#!/bin/zsh

# Exit on error
set -e

# Colors for output
GREEN="\033[0;32m"
RED="\033[0;31m"
NC="\033[0m"

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Run brew.zsh
echo -e "${GREEN}Running brew.zsh...${NC}"
if [ -f "$SCRIPT_DIR/brew.zsh" ]; then
    zsh "$SCRIPT_DIR/brew.zsh"
else
    echo -e "${RED}brew.zsh not found in $SCRIPT_DIR. Aborting.${NC}"
    exit 1
fi

# Run nan.zsh
echo -e "${GREEN}Running nan.zsh...${NC}"
if [ -f "$SCRIPT_DIR/nan.zsh" ]; then
    zsh "$SCRIPT_DIR/nan.zsh"
else
    echo -e "${RED}nan.zsh not found in $SCRIPT_DIR. Aborting.${NC}"
    exit 1
fi

echo -e "${GREEN}Updating Homebrew...${NC}"
brew update

# Install tools via Homebrew
brew install gnupg
brew install ripgrep
brew install stylua
brew install uv

# Install Bun via official installer
echo -e "${GREEN}Installing Bun via official installer...${NC}"
curl -fsSL https://bun.sh/install | bash
export PATH="$HOME/.bun/bin:$PATH"  # make bun immediately available

# Install Rust via rustup
echo -e "${GREEN}Installing Rust via rustup...${NC}"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env

# Install Swift via swiftly
echo -e "${GREEN}Installing Swift using swiftly...${NC}"
cd "$SCRIPT_DIR"
curl -O https://download.swift.org/swiftly/darwin/swiftly.pkg
installer -pkg swiftly.pkg -target CurrentUserHomeDirectory
~/.swiftly/bin/swiftly init --quiet-shell-followup
. "${SWIFTLY_HOME_DIR:-$HOME/.swiftly}/env.sh"
hash -r
rm -f swiftly.pkg  # cleanup installer

echo -e "${GREEN}All done!${NC}"
