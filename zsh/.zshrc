# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# if user is root, disable warning about unsafe dirs
if [[ "$USER" -eq "root" ]]; then
    ZSH_DISABLE_COMPFIX=true
fi

alias powerup="sudo -E zsh"

setopt appendhistory
setopt auto_cd

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    safe-paste
    docker-compose
    aliases
    ansible
    colored-man-pages
    nmap
    ripgrep
    z
    history-substring-search
    sudo
)

source $ZSH/oh-my-zsh.sh

# User configuration

## Aliases
# docker
alias dc='docker compose'
# alias dc='docker-compose'

# kitty
alias kittyconf='nvim $HOME/.config/kitty/kitty.conf'

# zsh
alias zshconf='nvim $HOME/.zshrc'
alias zshreload='source $HOME/.zshrc'

# nvim
alias nn='nvim'

# ls (exa override)
alias ls='exa --group-directories-first --icons'
alias ll='exa -l --group-directories-first --icons'
alias la='exa -la --group-directories-first --icons'

# yarn 
alias ya='yarn add'
alias yad='yarn add -D'
alias yag='yarn global add'

# docker
alias dc='docker-compose'

# git
alias changeMEP='git log --no-merges --pretty=oneline --abbrev-commit --no-decorate origin/master..origin/develop | sed "s/^\(\w\)* //"'
alias giraph="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --decorate --date=short"

# tmuxinator
alias mux='tmuxinator'
alias dmux="TMUX='' tmux"
sw() {
    echo $@ | xargs -n1 tmuxinator start
}
kw() {
    echo $@ | xargs -n1 tmuxinator stop
}
viaco-start() {
    cd ~/Documents/Work;for folder in "serverless-api" "react-admin" "webapp"; do (cd "$folder"; git checkout -b $1); done
}
viaco-resume() {
    cd ~/Documents/Work;for folder in "serverless-api" "react-admin" "webapp"; do (cd "$folder"; git checkout $1); done
}
alias viaco-develop-reset='cd ~/Documents/Work;for folder in "serverless-api" "react-admin" "webapp"; do (cd "$folder"; git checkout develop; git pull); done'
alias swa='tmuxinator list | grep -v tmuxinator | xargs -n 1 tmuxinator start'
alias kwa='tmuxinator list | grep -v tmuxinator | xargs -n 1 tmuxinator stop'
alias kbgen='$HOME/Documents/Code/keyboard/kbgen_dvorak && xset r rate 250 50'
# alias asdf='$HOME/Documents/Code/keyboard/kbgen_dvorak && xset r rate 250 50'
# alias aoeu='$HOME/Documents/Code/keyboard/kbgen_dvorak && xset r rate 250 50'
# alias asdf=$HOME/Documents/Code/keyboard/kbgen_dvorak && setxkbmap real-prog-dvorak -option caps:escape && xset r rate 250 50'
# alias aoeu='$HOME/Documents/Code/keyboard/kbgen_dvorak && setxkbmap real-prog-dvorak -option caps:escape && xset r rate 250 50'
# alias aoeu='$HOME/Documents/Code/keyboard/kbgen_dvorak && setxkbmap real-prog-dvorak -option caps:escape && xset r rate 250 50'
alias dvo='$HOME/Documents/Code/keyboard/kbgen_dvorak && setxkbmap real-prog-dvorak -option caps:escape && xset r rate 280 30'
alias aoeu='xset r rate 280 30'

# scale
alias scale='gsettings set org.gnome.desktop.interface text-scaling-factor 1.0 && regolith-look refresh'
alias bigScale='gsettings set org.gnome.desktop.interface text-scaling-factor 2.0 && regolith-look refresh'
alias medScale='gsettings set org.gnome.desktop.interface text-scaling-factor 1.5 && regolith-look refresh'
customScale() {
    gsettings set org.gnome.desktop.interface text-scaling-factor $1 && regolith-look refresh
}
# vpn
alias wgup='sudo wg-quick up wg0'
alias wgdown='sudo wg-quick down wg0'
#
eskill() {
    ps -ax | grep eslint | grep -v grep | awk '{print $1}' | xargs kill -9
}
alias tskill='ps -ax | grep tsserver | grep -v grep | awk "{print $1}" | xargs kill -9'

# fixes
alias node-fix-local='sudo chown -R $USER ./node_modules'
alias node-fix-global='sudo chown -R $USER $HOME/.cache/yarn/'

alias picom-start='/usr/bin/picom --config /home/ostrogoth/.config/regolith2/picom/config &; disown %1; exit'
picom-kill() {
    ps -ax | grep /usr/bin/picom | grep -v grep | awk '{print $1}' | xargs kill -9
}
alias dixit='disown %1; exit'

fuck-limits() {
    sudo ifconfig wlan0 down
    sudo macchanger -a wlan0
    sudo ifconfig wlan0 up
    echo 'No limits for the wicked!'
}

export TERM=xterm-256color

export EDITOR="nvim"

## Paths
# zsh scripts
export PATH="$PATH:$HOME/.config/zsh/scripts/"
# cargo
export PATH=$PATH:$HOME/.local/cargo/bin

# bob/nvim
export PATH=$PATH:$HOME/.local/share/bob/nvim-bin

# yarn
export PATH=$PATH:$HOME/.config/yarn/global/node_modules/.bin

# ghcup
export PATH=$PATH:$HOME/.ghcup/env
export PATH=$PATH:$HOME/.ghcup/bin


alias audio-restart="systemctl --user restart pipewire.service"
alias tidoudi="aplay /usr/share/sounds/sound-icons/prompt.wav 2>/dev/null &"

alias t='clear;tb '

# go
export PATH=$PATH:/usr/local/go/bin

# token for viaco-shared-packages
export DEPLOY_TOKEN='babadook'
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# pnpm
alias pn='pnpm '
alias px='pn dlx '
export PNPM_HOME="/home/ostrogoth/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
alias vexw='free -h && sudo sysctl -w vm.drop_caches=3 && sudo sync && echo 3 | sudo tee /proc/sys/vm/drop_caches && free -h'
eval "$(atuin init zsh)"

# bun completions
[ -s "/home/ostrogoth/.bun/_bun" ] && source "/home/ostrogoth/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
