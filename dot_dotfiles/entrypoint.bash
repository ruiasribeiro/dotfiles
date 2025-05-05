BASE_DIR="$HOME/.dotfiles"

. "$BASE_DIR"/aliases.bash
. "$BASE_DIR"/functions.bash

export PATH="$PATH:$HOME/.local/bin"

for init_script in "$BASE_DIR"/initialisation/*.bash; do
  . "$init_script"
done

# Enables real-time updates for Bash history (useful when multiple terminals are
# open at the same time).
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
