#!/bin/bash
# Sets zsh as the default shell if it isn't already.
# chezmoi runs this once per machine.
set -euo pipefail

ZSH_PATH="$(command -v zsh)"

if [[ -z "$ZSH_PATH" ]]; then
    echo "zsh not found — install it first via packages" >&2
    exit 1
fi

if [[ "$SHELL" != "$ZSH_PATH" ]]; then
    echo "Setting default shell to $ZSH_PATH"
    # Add zsh to /etc/shells if it's not already there (needed for chsh)
    if ! grep -qF "$ZSH_PATH" /etc/shells; then
        echo "$ZSH_PATH" | sudo tee -a /etc/shells
    fi
    chsh -s "$ZSH_PATH"
fi
