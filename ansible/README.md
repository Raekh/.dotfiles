# Dotfiles Ansible Playbook

Ansible playbook to install all dependencies for the dotfiles on a fresh system.

## Supported Systems

- Ubuntu / Debian
- Arch Linux

## Prerequisites

```bash
# Ubuntu/Debian
sudo apt update && sudo apt install -y ansible

# Arch
sudo pacman -S ansible
```

## Usage

```bash
cd ~/.dotfiles/ansible
ansible-playbook playbook.yml --ask-become-pass
```

## What Gets Installed

| Role | Tools |
|------|-------|
| base | git, curl, build-essential, stow, etc. |
| rust | rustup + cargo |
| go | golang |
| haskell | ghcup |
| python | pyenv + pyenv-virtualenv |
| nodejs | pnpm, bun |
| shell | zsh, oh-my-zsh, atuin, oh-my-posh |
| neovim | bob (nvim version manager) + nvim |
| terminal | tmux, TPM, tmuxinator, ghostty |
| cli_tools | exa, gum, lazygit, lazydocker |

## Configuration

Edit `group_vars/all.yml` to customize:

- `neovim_version`: Which nvim version bob should install (default: stable)
- `python_version`: Which Python version pyenv should install (default: 3.12.0)
- `install_ghostty`: Enable/disable ghostty installation (default: true)
- `install_haskell`: Enable/disable ghcup installation (default: true)

## Post-Install

After running the playbook:

1. Run the dotfiles stow script:
   ```bash
   cd ~/.dotfiles && ./install
   ```

2. Start a new shell session (or run `zsh`)

3. First tmux launch will install TPM plugins automatically (press `prefix + I`)

4. First nvim launch will install lazy.nvim plugins automatically

## Notes

- Ghostty on Arch needs AUR: `yay -S ghostty-git`
- The playbook is idempotent (safe to run multiple times)
- Roles only install tools; your dotfiles handle configuration
