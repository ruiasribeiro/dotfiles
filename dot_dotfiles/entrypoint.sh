#!/usr/bin/env bash

# Tested with Ubuntu 24.04.

BASE_DIR="$HOME/.dotfiles"

. "$BASE_DIR"/aliases.sh
. "$BASE_DIR"/functions.sh

# before 0.48.0
source /usr/share/doc/fzf/examples/key-bindings.bash
# after 0.48.0
# eval "$(fzf --bash)

export PATH="$PATH:$HOME/.cargo/bin"
