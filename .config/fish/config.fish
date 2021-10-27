if status is-interactive
    # Commands to run in interactive sessions can go here
    cat ~/.cache/wal/sequences
end

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/ruir/.ghcup/bin $PATH # ghcup-env

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# eval /usr/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

starship init fish | source

source ~/.cache/wal/colors.fish