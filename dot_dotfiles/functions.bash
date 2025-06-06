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

# Rebuilds NVIDIA drivers using the open-source version.
# For more information, check: https://rpmfusion.org/Howto/NVIDIA#Kernel_Open
rebuild_nvidia_open() {
    sudo sh -c 'echo "%_with_kmod_nvidia_open 1" > /etc/rpm/macros.nvidia-kmod'
    sudo akmods --kernels "$(uname -r)" --rebuild
    printf "Restart to apply rebuilt drivers.\n"
}
export -f rebuild_nvidia_open

# Determine which program is currently using a given port.
which_port() {
    if [[ -z $1 ]]; then
        echo 'Usage: which_port <PORT>' >&2
        return 1
    fi

    local port=$1
    netstat --all --numeric --program | grep "$port"
}
export -f which_port
