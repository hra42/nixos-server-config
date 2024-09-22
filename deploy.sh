#!/bin/bash

# Exit on any error
set -e

# Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

# Define source and destination directories
SRC_DIR="/home/nixos/nixos-config"
DEST_DIR="/etc/nixos"

# Create modules directory if it doesn't exist
mkdir -p "$DEST_DIR/modules"

# Copy configuration files
cp "$SRC_DIR/configuration.nix" "$DEST_DIR/"

# Copy module files
for module in "$SRC_DIR/modules"/*.nix; do
  cp "$module" "$DEST_DIR/modules/"
done

echo "Configuration files deployed to $DEST_DIR"
nixos-rebuild switch
echo "Config applied"
