#!/bin/bash

# URL to your .deb file on GitHub
DEB_URL="https://github.com/prad9036/telegram-bot-api/releases/download/telegram-bot-api-new/telegram-bot-api.deb"
#https://github.com/prad9036/telegram-bot-api/releases/download/telegram-bot-api-new/telegram-bot-api.deb

TMP_DEB="$(mktemp)" || { echo "Failed to create temp file"; exit 1; }

echo "Downloading telegram-bot-api package..."
curl -fsSL "$DEB_URL" -o "$TMP_DEB" || { echo "Download failed"; exit 1; }

# Check for sudo without prompt
if sudo -n true 2>/dev/null; then
    echo "Sudo detected, installing system-wide..."
    sudo dpkg -i "$TMP_DEB" && sudo apt-get install -f -y
    rm -f "$TMP_DEB"
    echo "telegram-bot-api installed system-wide. You can run 'telegram-bot-api'."
else
    echo "No sudo detected, installing locally..."

    LOCAL_DIR="$HOME/mytelegrambot"
    BIN_DIR="$HOME/bin"
    mkdir -p "$LOCAL_DIR"
    mkdir -p "$BIN_DIR"

    echo "Extracting package to $LOCAL_DIR..."
    dpkg-deb -x "$TMP_DEB" "$LOCAL_DIR" || { echo "Extraction failed"; exit 1; }

    echo "Copying binary to $BIN_DIR..."
    cp -f "$LOCAL_DIR/usr/bin/telegram-bot-api" "$BIN_DIR/"
    chmod +x "$BIN_DIR/telegram-bot-api"

    rm -f "$TMP_DEB"

    # Add ~/bin to PATH in ~/.bashrc if not already there
    if ! grep -q 'export PATH=$HOME/bin:$PATH' "$HOME/.bashrc"; then
        echo 'export PATH=$HOME/bin:$PATH' >> "$HOME/.bashrc"
        echo "Added ~/bin to PATH in ~/.bashrc. Please restart your terminal or run 'source ~/.bashrc'."
    else
        echo "~/bin already in PATH."
    fi

    echo "telegram-bot-api installed locally. Run 'telegram-bot-api' after restarting your shell."
fi
