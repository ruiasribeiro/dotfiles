#!/usr/bin/env bash

alias reload='. $HOME/.bashrc'

alias cm='chezmoi'
alias cmra='chezmoi re-add'
alias cmup='chezmoi git add . && chezmoi git -- commit -m "update dotfiles" && chezmoi git push'

# Delete all local branches (other than the primary ones). Other branches can
# also be ignored, if added to the `grep` expression.
alias git_clean_local='git branch | grep -v -E "main|master|dev|develop" | xargs git branch -D'
# Prune local tracking branches not on remote.
alias git_prune_old='git remote prune origin'

# Use `ls` with sensible defaults.
alias lls='LC_COLLATE="C" ls -hal --group-directories-first'

# Change to the selected directory inside `ranger` when exiting.
alias rcd='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
