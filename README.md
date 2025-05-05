# dotfiles

My personal dotfiles.

This repository was set up using [chezmoi](https://github.com/twpayne/chezmoi).

## Quick start

This setup expects the following variables inside `~/.config/chezmoi/chezmoi.toml`, which must be defined before starting the setup:

```toml
[data]
git_email = "..."
machine = "personal" | "work"
```

To initialise `chezmoi` with a single command:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply ruiasribeiro
```

To update after the first initialisation:

```bash
chezmoi update
```
