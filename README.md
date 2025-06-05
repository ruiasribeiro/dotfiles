# dotfiles

My personal dotfiles.

This repository was set up using [chezmoi](https://github.com/twpayne/chezmoi).

## Quick start

This setup expects the following variables inside `~/.config/chezmoi/chezmoi.toml`, which must be defined beforehand:

```toml
[data]
git_email = "..."
machine = "personal" # or "work"
```

To create the file in one go:

```bash
mkdir -p ~/.config/chezmoi
cat > ~/.config/chezmoi/chezmoi.toml << 'EOF'
[data]
git_email = "..."
machine = "personal" # or "work"
EOF
```

To initialise `chezmoi` with a single command:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply ruiasribeiro
```

To update after the first initialisation:

```bash
chezmoi update
```
