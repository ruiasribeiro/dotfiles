#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

curl -sS https://starship.rs/install.sh | sh -s -- -y
