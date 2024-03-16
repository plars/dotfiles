#! /usr/bin/env bash

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

SOURCE="$(realpath -m .)"
DESTINATION="$(realpath -m ~)"

info "Configuraing tmux..."

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

find . -name ".tmux*" | while read fn; do
    fn=$(basename $fn)
    symlink "$SOURCE/$fn" "$DESTINATION/$fn"
done

# Install tmux plugins
"$HOME"/.tmux/plugins/tpm/bin/install_plugins || true

success "Finished configuring tmux."
