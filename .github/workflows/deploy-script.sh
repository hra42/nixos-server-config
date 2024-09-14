#!/bin/bash
set -e

echo "Starting deployment script"

REPO_DIR=~/nixos-config

if [ -z "$REPO_URL" ]; then
  echo "Error: REPO_URL is not set"
  exit 1
fi

if [ -d "$REPO_DIR" ]; then
  echo "Repository exists. Pulling latest changes..."
  cd "$REPO_DIR"
  git pull origin main
else
  echo "Repository doesn't exist. Cloning..."
  git clone $REPO_URL "$REPO_DIR"
  cd "$REPO_DIR"
fi

echo "Ensuring deploy script is executable"
chmod +x /home/$SERVER_USER/deploy.sh

echo "Running deploy script"
bash /home/$SERVER_USER/deploy.sh

echo "Deployment complete"
