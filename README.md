# Dotfiles

Config files for macOS, Ubuntu, and Bluefin/Fedora. Managed with [chezmoi](https://www.chezmoi.io/).

This should always be considered a work-in-progress, and never really complete!

## Setup

### 1. Install chezmoi

**macOS**
```bash
brew install chezmoi
```

**Linux (Ubuntu, Bluefin, or any distro with Homebrew)**
```bash
sh -c "$(curl -fsLS get.chezmoi.io)"
```

### 2. Clone this repo

```bash
git clone git@github.com:pwlars/dotfiles.git ~/dotfiles
```

### 3. Link chezmoi to the repo

chezmoi expects its source at `~/.local/share/chezmoi`. Point it at the cloned repo:

```bash
mkdir -p ~/.local/share
ln -sf ~/dotfiles ~/.local/share/chezmoi
```

### 4. Apply

Dry run first to see what would change:

```bash
chezmoi apply -n
```

Then apply for real:

```bash
chezmoi apply
```

The first run will prompt for your git email address, which is stored in
`~/.config/chezmoi/chezmoi.toml` and reused on subsequent runs.

## Selective deployment

Apply a single file:
```bash
chezmoi apply ~/.zshrc
```

See what would change without applying:
```bash
chezmoi diff
```

Check the status of managed files:
```bash
chezmoi status
```

## What's managed

| File | Destination |
|------|-------------|
| `dot_zshrc.tmpl` | `~/.zshrc` |
| `dot_gitconfig.tmpl` | `~/.gitconfig` |
| `dot_tmux.conf` | `~/.tmux.conf` |
| `dot_p10k.zsh` | `~/.p10k.zsh` |
| `dot_antigen.zsh` | `~/.antigen.zsh` |
| `dot_config/ghostty/config` | `~/.config/ghostty/config` |

## Packages

Package lists live in `packages/`:

| File | Used on |
|------|---------|
| `Brewfile` | macOS |
| `Brewfile.linux` | Linux (via Homebrew) |
| `apt.list` | Ubuntu / Debian |
| `rpm-ostree.list` | Bluefin / Fedora |

Install packages manually by running the appropriate `run_once_10-install-packages.sh.tmpl`
script, or let chezmoi handle it automatically on first apply.

## Platform notes

- **macOS**: Homebrew is the primary package manager. The `Brewfile` includes casks (GUI apps).
- **Ubuntu**: apt handles system packages; Homebrew handles user CLI tools.
- **Bluefin**: `rpm-ostree` for system packages (requires reboot); Homebrew for user tools.
  Bluefin is immutable so prefer Homebrew where possible.
