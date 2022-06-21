#! /usr/bin/env bash

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

COMMENT=\#*

sudo -v

if which brew > /dev/null; then
    info "Installing Brewfile packages..."
    brew bundle
    success "Finished installing Brewfile packages."
fi

if which apt > /dev/null; then
    info "Updating apt..."
    sudo apt update
fi

# Misc packages
# I know curl installs are terrible, but this one keeps it in an isolated
# place (~/.poetry) and enables self-update
echo "Installing poetry..."
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3 -

find * -name "*.list" | while read fn; do
    cmd="${fn%.*}"
    set -- $cmd
    info "Installing $1 packages..."
    while read package; do
        if [[ $package == $COMMENT ]]; then continue; fi
        substep_info "Installing $package..."
        $cmd $package
    done < "$fn"
    success "Finished installing $1 packages."
done
