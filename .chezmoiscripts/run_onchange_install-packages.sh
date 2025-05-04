#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

APT_PACKAGES=(
    fzf
    ncdu
    pipx
    ranger
    rustup
)

CARGO_PACKAGES=(
    starship
)

sudo apt update
sudo apt upgrade -y
sudo apt install -y "${APT_PACKAGES[@]}"

pipx ensurepath
rustup toolchain install stable

cargo install --locked "${CARGO_PACKAGES[@]}"