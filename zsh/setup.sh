#! /usr/bin/env bash

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

SOURCE="$(realpath -m .)"
DESTINATION="$(realpath -m ~)"

info "Setting up zsh shell..."

substep_info "Creating zsh config folders..."
mkdir -p "$DESTINATION/functions"
mkdir -p "$DESTINATION/completions"

find . -name "*.zsh*" | while read fn; do
    fn=$(basename $fn)
    symlink "$SOURCE/$fn" "$DESTINATION/$fn"
done
clear_broken_symlinks "$DESTINATION"

set_zsh_shell() {
    if grep --quiet zsh <<< "$SHELL"; then
        success "Zsh shell is already set up."
    else
        substep_info "Setting zsh as the default shell (you may be prompted for your password"
        if chsh -s "$(which zsh)"; then
            substep_success "Changed shell to zsh"
        else
            substep_error "Failed changing shell to zsh"
            return 2
        fi
    fi
}

if set_zsh_shell; then
    success "Logout and log back in to complete shell setup!"
else
    error "Failed setting up zsh shell."
fi

