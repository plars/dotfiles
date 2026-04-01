#!/bin/bash
# Installs Tmux Plugin Manager and plugins.
# chezmoi runs this once per machine.
set -euo pipefail

TPM_DIR="$HOME/.tmux/plugins/tpm"

if ! command -v tmux &>/dev/null; then
    echo "tmux not found — skipping plugin install" >&2
    exit 0
fi

if [[ ! -d "$TPM_DIR" ]]; then
    echo "Installing Tmux Plugin Manager..."
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
fi

echo "Installing tmux plugins..."
"$TPM_DIR/bin/install_plugins"
