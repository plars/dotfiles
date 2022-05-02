#!/usr/bin/env bash

DIR=$(dirname "$0")
cd "$DIR"

. scripts/functions.sh

# Package control must be executed first in order for the rest to work
./packages/setup.sh

find * -name "setup.sh" -not -wholename "packages*" | while read setup; do
    ./$setup
done

success "Finished installing Dotfiles"
