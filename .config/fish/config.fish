if status is-interactive
    # Commands to run in interactive sessions can go here.

    # Start the Starship prompt.
    starship init fish | source
end

# Dotfiles helper.
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
