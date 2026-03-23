#!/bin/bash
# Set up the Aria APT repository on a user's machine
set -e

REPO_URL="${REPO_URL:-https://packages.ariax.ai-liberation-platform.org}"
DISTRIBUTION="${DISTRIBUTION:-noble}"

echo "Setting up Aria package repository..."

# Download and install GPG key
curl -fsSL "${REPO_URL}/aria-archive-keyring.gpg" | \
    sudo gpg --dearmor -o /usr/share/keyrings/aria-archive-keyring.gpg

# Add repository
echo "deb [signed-by=/usr/share/keyrings/aria-archive-keyring.gpg] ${REPO_URL} ${DISTRIBUTION} main" | \
    sudo tee /etc/apt/sources.list.d/aria.list > /dev/null

# Update
sudo apt-get update

echo ""
echo "Aria repository configured!"
echo ""
echo "Available packages:"
echo "  aria              - Aria compiler, LSP, stdlib"
echo "  aria-tools        - Safety audit, MCP server"
echo "  aria-man-pages    - Man pages"
echo "  aria-packages     - Ecosystem packages"
echo ""
echo "Install with: sudo apt install aria"
