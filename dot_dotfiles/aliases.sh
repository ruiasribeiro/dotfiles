#!/usr/bin/env bash

alias cm='chezmoi'
alias cmra='chezmoi re-add'
alias cmup='chezmoi git add . && chezmoi git -- commit -m "update dotfiles" && chezmoi git push'

alias redot='. $HOME/.bashrc'
