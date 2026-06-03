# Fresh Install Gap Checklist

This checklist captures what is missing between the current live machine setup and what the Ansible reinstall currently guarantees.

## Currently stowed packages

- `ghostty`
- `Hyprland`
- `kanshi`
- `nvim`
- `oh-my-posh`
- `opencode`
- `tmux`
- `tmuxinator`
- `zsh`

## Already covered reasonably well by Ansible

- base tools: `git`, `curl`, `wget`, `unzip`, `stow`, `jq`, build tools
- shell/tooling: `zsh`, `oh-my-zsh`, `atuin`, `oh-my-posh`
- language managers: `rustup`, `go`, `pyenv`, `bun`, `pnpm`
- editor/terminal: `tmux`, `tmuxinator`, `TPM`, `bob`, `nvim`, `ghostty`
- CLI tools: `gum`, `lazygit`, `lazydocker`, `exa`
- `opencode` base install and `oh-my-opencode`

## Gaps that block a real desktop/workflow restore

### Hyprland desktop stack

- install `hyprland`
- install `kanshi`
- install `hyprlock`
- install `hypridle`
- install `xdg-desktop-portal-hyprland`

### Wayland desktop helpers used by Hypr config/scripts

- `swaync`
- `wlogout`
- `wl-clipboard`
- `cliphist`
- `grim`
- `slurp`
- `swappy`
- `brightnessctl`
- `playerctl`
- `pamixer`
- `pavucontrol`
- `network-manager-applet`
- `blueman`
- `rofi`
- `qalculate-gtk`
- `swww`
- `waybar` (even if currently disabled, scripts and keybinds still reference it)

### Font/runtime assumptions

- install a package that provides `Iosevka Term SS15`
- ensure a polkit agent is present (`polkit-gnome` or KDE equivalent)

### Shell/runtime assumptions outside Ansible

- `docker` and Compose plugin if Docker aliases are expected to work
- `xsel`
- `bat` or distro equivalent for `batcat`
- `fnm` if the zsh config is expected to use it
- `jiratui` if those aliases are expected to work

### Opencode-specific gaps

- required env vars are not provisioned:
  - `OPENCODE_CONTEXT_KEY`
  - `FIGMA_API_KEY`
  - `OPENCODE_BROWSERCONTROL_KEY`
  - `JIRA_EMAIL`
  - `JIRA_API_TOKEN`
  - `SENTRY_AUTH_TOKEN`
- local repo dependency is not provisioned:
  - `/home/raekh/Documents/Code/browser-control-mcp/mcp-server/dist/server.js`

### Documentation / process gaps

- `ansible/README.md` references `playbook.yml`, but the repo uses `playbook-debian.yml` and `playbook-arch.yml`
- stow happens separately via `./install`; the playbooks do not currently call it
- `opencode` configuration contains committed `node_modules`, which is convenient locally but brittle as a fresh-install strategy

## Manual steps still likely required after Ansible

- clone dotfiles repo
- run `./install-ansible`
- run `./install` to stow packages
- log into a Hyprland session and validate the session file works
- install TPM plugins in tmux
- open Neovim once to let Lazy install plugins
- supply env secrets for OpenCode MCP servers
- restore or clone the local `browser-control-mcp` repository

## EndeavourOS-specific notes

- prefer `community.general.pacman` for repo packages first
- use `kanshi` from repos
- `ghostty` may still require AUR depending on the mirror/state of the distribution
- verify exact package names for Iosevka and any optional shell utilities if moving to a fresh machine
