if status is-interactive
    # Commands to run in interactive sessions can go here
    
    # Activates pywal color scheme
    # cat ~/.cache/wal/sequences
end

if test "$XDG_SESSION_DESKTOP" = "sway"
    export _JAVA_AWT_WM_NONREPARENTING=1
end

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/ruir/.ghcup/bin $PATH # ghcup-env

starship init fish | source
# fish_ssh_agent
# source ~/.cache/wal/colors.fish

set -gx JAVA_HOME /etc/alternatives/jre

source ~/.asdf/asdf.fish
