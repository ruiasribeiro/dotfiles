# Check if a given program exists.
exists() {
    if [[ -z $1 ]]; then
        echo 'Usage: exists <PROGRAM>' >&2
        return 1
    fi

    local program=$1
    command -v "$program" >/dev/null 2>&1
}
export -f exists

# Determine which program is currently using a given port.
which_port() {
    if [[ -z $1 ]]; then
        echo 'Usage: which_port <PORT>' >&2
        return 1
    fi

    local port=$1
    netstat --all --program | grep "$port"
}
export -f which_port
