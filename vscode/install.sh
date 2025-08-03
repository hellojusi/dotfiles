#!/bin/bash

# Symlink settings and snippets
stow --target="$HOME/Library/Application Support/Code/User" vscode

# Install extensions
xargs -n1 code --install-extension < "$HOME/dotfiles/vscode/extensions.txt"
