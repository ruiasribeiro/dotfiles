#!/usr/bin/env bash

exists() {
    local program=$1
    command -v "$program" >/dev/null 2>&1
}
export -f exists