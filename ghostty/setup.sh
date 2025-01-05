#! /usr/bin/env bash

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

SOURCE="$(realpath -m .)"
DESTINATION="$(realpath -m ~)/.config/ghostty"

info "Configuraing ghostty..."

mkdir -p $DESTINATION

find . -name "config" | while read fn; do
    fn=$(basename $fn)
    symlink "$SOURCE/$fn" "$DESTINATION/$fn"
done

success "Finished configuring ghostty."
