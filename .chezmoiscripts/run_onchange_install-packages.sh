#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

APT_PACKAGES=(
    build-essential
    cmake
    fzf
    ncdu
    ranger
    rustup
)

CARGO_PACKAGES=(
    starship
)

sudo apt update
sudo apt upgrade -y
sudo apt install -y "${APT_PACKAGES[@]}"

rustup toolchain install stable
cargo install --locked "${CARGO_PACKAGES[@]}"

cargo install --git https://github.com/astral-sh/uv uv
uv python install 3.13