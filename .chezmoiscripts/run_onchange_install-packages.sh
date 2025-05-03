#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

PACKAGES=(
    fzf
    ncdu
    ranger
)

sudo apt update
sudo apt upgrade -y
sudo apt install -y "${PACKAGES[@]}"