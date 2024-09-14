#!/bin/bash
set -e

REPO_DIR=~/nixos-config

if [ -d "$REPO_DIR" ]; then
  echo "Repository exists. Pulling latest changes..."
  cd "$REPO_DIR"
  git pull origin main
else
  echo "Repository doesn't exist. Cloning..."
  git clone $REPO_URL "$REPO_DIR"
  cd "$REPO_DIR"
fi

# Ensure deploy script is executable
chmod +x deploy.sh

# Run deploy script
./deploy.sh
