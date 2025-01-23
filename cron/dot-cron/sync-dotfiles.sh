#!/bin/zsh
# Navigate to the dotfiles directory
cd ~/.dotfiles

# Use Homebrew's GPG path
export PATH="/opt/homebrew/bin:$PATH"

# Check for git changes
if [[ -n $(git status --porcelain) ]]; then
    # Get the current time
    current_time=$(date +"%Y-%m-%d %H:%M:%S")

    # Add all changes to staging
    git add .

    # Commit the changes with the message including the current time
    git commit -m "dotfiles automatically synced in $current_time"
    git push
fi
