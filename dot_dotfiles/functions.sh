#!/usr/bin/env bash

# Check if a given program exists.
exists() {
    if [[ $# -ne 1 ]]; then
        echo 'Too many/few arguments, usage: exists <PROGRAM>' >&2
        return 1
    fi

    local program=$1
    command -v "$program" >/dev/null 2>&1
}
export -f exists

# Determine which program is currently using a given port.
which_port() {
    if [[ $# -ne 1 ]]; then
        echo 'Too many/few arguments, usage: which_port <PORT>' >&2
        return 1
    fi

    local port=$1
    netstat --all --program | grep "$port"
}
export -f exists
