#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

PACKAGES=(
    fzf
    ranger
)

sudo apt install "${PACKAGES[@]}"