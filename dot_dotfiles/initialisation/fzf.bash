fzf_version="$(fzf --version | awk '{print $1}')"
if dpkg --compare-versions "$fzf_version" lt 0.48.0; then
    source /usr/share/doc/fzf/examples/key-bindings.bash
else
    eval "$(fzf --bash)"
fi
