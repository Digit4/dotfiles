#!/usr/bin/env bash

set -e

ZSH_PLUGIN_DIR="${HOME}/.zsh"

mkdir -p "$ZSH_PLUGIN_DIR"

# zsh-syntax-highlighting
if [ ! -d "$ZSH_PLUGIN_DIR/zsh-syntax-highlighting" ]; then
  echo "Cloning zsh-syntax-highlighting..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_PLUGIN_DIR/zsh-syntax-highlighting"
else
  echo "zsh-syntax-highlighting already exists. Skipping."
fi

# zsh-autosuggestions
if [ ! -d "$ZSH_PLUGIN_DIR/zsh-autosuggestions" ]; then
  echo "Cloning zsh-autosuggestions..."
  git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_PLUGIN_DIR/zsh-autosuggestions"
else
  echo "zsh-autosuggestions already exists. Skipping."
fi

echo "✅ Done! Don't forget to add the source lines in your .zshrc:"
echo '  source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'
echo '  source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh'

