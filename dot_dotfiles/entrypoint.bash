# Tested with Ubuntu 24.04.

BASE_DIR="$HOME/.dotfiles"

. "$BASE_DIR"/aliases.bash
. "$BASE_DIR"/functions.bash

export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.cargo/bin"

for init_script in "$BASE_DIR"/initialisation/*.bash; do
  . "$init_script"
done
