BASE_DIR="$HOME/.dotfiles"

. "$BASE_DIR"/aliases.bash
. "$BASE_DIR"/functions.bash
. "$BASE_DIR"/keybindings.bash

export PATH="$PATH:$HOME/.local/bin"

for init_script in "$BASE_DIR"/initialisation/*.bash; do
  . "$init_script"
done
