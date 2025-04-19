#!/usr/bin/env bash

alias cm='chezmoi'
alias cmup='cm git add . && cm git -- commit -m "update dotfiles" && cm git push'
alias redot='. $HOME/.bashrc'
