#!/bin/bash

exists() {
    local program=$1
    command -v "$program" >/dev/null 2>&1
}

if exists python3; then
    echo "it exists!"
fi
