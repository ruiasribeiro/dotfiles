#!/usr/bin/env bash

alias redot='. $HOME/.bashrc'

alias cm='chezmoi'
alias cmra='chezmoi re-add'
alias cmup='chezmoi git add . && chezmoi git -- commit -m "update dotfiles" && chezmoi git push'

alias rcd='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
