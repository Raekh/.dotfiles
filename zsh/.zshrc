# Initialization {{{
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# if [ -z "$TMUX" ]; then
#     exec tmux new-session -A -s workspace
# fi

# if user is root, disable warning about unsafe dirs
if [[ "$USER" -eq "root" ]]; then
    ZSH_DISABLE_COMPFIX=true
fi
# }}}

# Oh-my-zsh {{{
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#@todo: change this probably
# ZSH_THEME="powerlevel10k/powerlevel10k"

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
    aliases
    ansible
    colored-man-pages
    nmap
    z
    history-substring-search
    sudo
)

source $ZSH/oh-my-zsh.sh
# }}}

# Aliases {{{
## Ubuntu
alias fu='sudo --preserve-env'
alias fus='sudo --preserve-env zsh'

## Docker
alias dc='docker compose'
alias 'docker-compose'='docker compose'
alias make-dc='sed -i "s/docker-compose/docker compose/g" Makefile'
alias unmake-dc='sed -i "s/docker compose/docker-compose/g" Makefile'
alias dokill='docker ps -q | xargs docker kill'
alias ld='lazydocker'
nuke-docker() {
    docker network prune
    docker system prune
    docker volume prune
    docker stop `docker ps -qa`
    docker rm `docker ps -qa`
    docker rmi -f `docker images -qa `
    docker volume rm $(docker volume ls -q)
    docker network rm `docker network ls -q`
    docker network prune
    docker system prune
    docker volume prune
}

alias nex='docker compose exec node'
alias nap='nex yarn test-api $1 --watch'
alias napal='nex yarn test-api --watchAll'
alias nup='nex yarn test $1 --watch'
alias nupal='nex yarn test --watchAll'

## Htb
alias enable_ipv6="sudo sysctl net.ipv6.conf.all.disable_ipv6=0"
alias disable_ipv6="sudo sysctl net.ipv6.conf.all.disable_ipv6=1"


## Kitty
alias kittyconf='nvim $HOME/.config/kitty/kitty.conf'

## Zsh
alias zshconf='nvim $HOME/.zshrc'
alias zshreload='source $HOME/.zshrc'

## Nvim
alias nn='nvim'
alias nnotes='cd ~/notes && nvim ~/notes/index.norg'

## ls (exa override)
alias ls='exa --group-directories-first --icons'
alias ll='exa -l --group-directories-first --icons'
alias la='exa -la --group-directories-first --icons'

## Yarn
alias ya='yarn add'
alias yad='yarn add -D'
alias yag='yarn global add'
alias yaii='sudo rm -rf node_modules/.yarn-integrity && yarn install'

## Pnpm
alias pi="pnpm install"
alias pa="pnpm add"
alias pid="pnpm install -D"
alias pa="pnpm add -D"
alias pig="pnpm install -g"
alias pag="pnpm add -g"

## Git
alias changeMEP='git log --no-merges --pretty=oneline --abbrev-commit --no-decorate origin/master..origin/develop | sed "s/^\(\w\)* //"'
alias giraph="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --decorate --date=short"
alias gg='lazygit'

## Tmuxinator
alias mux='tmuxinator'
alias dmux="TMUX='' tmux"
sw() {
    echo $@ | xargs -n1 tmuxinator start
}
kw() {
    echo $@ | xargs -n1 tmuxinator stop
}
alias swa='tmuxinator list | grep -v tmuxinator | xargs -n 1 tmuxinator start'
alias kwa='tmuxinator list | grep -v tmuxinator | xargs -n 1 tmuxinator stop'

## Node stuff
alias pn='pnpm'

## Viaco
# Define environment variables
export WORK_FOLDER="$HOME/Documents/Work"
export VIACO_FOLDERS=("serverless-api" "react-admin" "webapp")
export SYWAV2_FOLDERS=("sywatt" "sywack")
export SYWAV1_FOLDERS=("sywatt" "sywack" "sywend")

# Define task-command function
task-command() {
    local -a folders=("${(@P)1}")
    local command=$2
    cd $WORK_FOLDER
    for folder in "${folders[@]}"; do
        (cd "$folder"; eval "$command")
    done
}

# Define develop-reset function
branches-prune() {
    local folders_name=$1
    local -a folders=("${(@P)folders_name}")
    local command='git removed-branches --prune'
    task-command folders "$command"
}

# Define develop-reset function
develop-reset() {
    local folders_name=$1
    local -a folders=("${(@P)folders_name}")
    local command='git checkout develop && git pull'
    task-command folders "$command"
}

# Define start-task function
start-task() {
    local folders_name=$1
    local branch=$2
    local -a folders=("${(@P)folders_name}")
    local command="git checkout -b $branch"
    task-command folders "$command"
}

# Define resume-task function
resume-task() {
    local folders_name=$1
    local branch=$2
    local -a folders=("${(@P)folders_name}")
    local command="git checkout $branch"
    task-command folders "$command"
}

# Define aliases
alias viaco-develop-reset='develop-reset VIACO_FOLDERS'
alias sywav2-develop-reset='develop-reset SYWAV2_FOLDERS'
alias sywav1-develop-reset='develop-reset SYWAV1_FOLDERS'
alias viaco-start-task='start-task VIACO_FOLDERS'
alias sywav2-start-task='start-task SYWAV2_FOLDERS'
alias sywav1-start-task='start-task SYWAV1_FOLDERS'
alias viaco-resume-task='resume-task VIACO_FOLDERS'
alias sywav2-resume-task='resume-task SYWAV2_FOLDERS'
alias sywav1-resume-task='resume-task SYWAV1_FOLDERS'
alias viaco-branches-prune='branches-prune VIACO_FOLDERS'
alias sywav2-branches-prune='branches-prune SYWAV2_FOLDERS'
alias sywav1-branches-prune='branches-prune SYWAV1_FOLDERS'

## Keyboard
alias kbgen='$HOME/Documents/Code/keyboard/kbgen_dvorak && xset r rate 250 50'
alias dvo='$HOME/Documents/Code/keyboard/kbgen_dvorak && setxkbmap real-prog-dvorak -option caps:escape && xset r rate 280 30'
alias aoeu='xset r rate 280 30'

## Scale
alias scale='gsettings set org.gnome.desktop.interface text-scaling-factor 1.0 && regolith-look refresh'
alias bigScale='gsettings set org.gnome.desktop.interface text-scaling-factor 2.0 && regolith-look refresh'
alias medScale='gsettings set org.gnome.desktop.interface text-scaling-factor 1.5 && regolith-look refresh'
customScale() {
    gsettings set org.gnome.desktop.interface text-scaling-factor $1 && regolith-look refresh
}

## VPN
alias wgup='sudo wg-quick up wg0'
alias wgdown='sudo wg-quick down wg0'

## Miscellaneous
eskill() {
    ps -ax | grep eslint | grep -v grep | awk '{print $1}' | xargs kill -9
}
alias tskill='ps -ax | grep tsserver | grep -v grep | awk "{print $1}" | xargs kill -9'
alias node-fix-local='sudo chown -R $USER ./node_modules'
alias node-fix-global='sudo chown -R $USER $HOME/.cache/yarn/'
picom-kill() {
    ps -ax | grep /usr/bin/picom | grep -v grep | awk '{print $1}' | xargs kill -9
}
alias dixit='disown %1; exit'

fuck-limits() {
    sudo ifconfig $1 down
    sudo macchanger -a $1
    sudo ifconfig $1 up
    echo 'No limits for the wicked!'
}

alias audio-restart="systemctl --user restart pipewire.service"
alias tidoudi="aplay /usr/share/sounds/sound-icons/prompt.wav 2>/dev/null &"
# alias t='clear; tb '
alias t='tmux'
alias tks='tmux kill-server'
alias vexw='free -h && sudo sysctl -w vm.drop_caches=3 && sudo sync && echo 3 | sudo tee /proc/sys/vm/drop_caches && free -h'
alias bat='batcat'
alias kilock='pkill -USR1 hyprlock'
# }}}

# clipboard
way2zep() {
    clippaste | xsel --display :99 --clipboard -i
}
zep2way() {
    xsel --display :99 --clipboard -o | clipcopy
}

# htb
init_htb_box() {
    mkdir $1
    cd $1
    touch recon.norg
    mkdir nmap gobuster www
    tmux run-shell 'tmux attach-session -c "#{pane_current_path}" \; display-message "Updated tmux path!"'
}

xephyr-run() {
    ~/xephyr-run.sh $1
}

# Environment Variables {{{
export compositor_name="Hyprland"
export TERM=xterm-256color
export EDITOR="nvim"
export DEPLOY_TOKEN='babadook'
export OHMYPOSH_HOME="$HOME/.config/ohmyposh"
export PNPM_HOME="/home/raekh/.local/share/pnpm"
export BUN_INSTALL="$HOME/.bun"
export N_PREFIX="$HOME/n"
export FNM_PATH="/home/raekh/.local/share/fnm"
# }}}

# Paths {{{
export PATH="$PATH:$HOME/.config/zsh/scripts/"
export PATH=$PATH:$HOME/.local/cargo/bin
export PATH=$PATH:$HOME/.local/share/bob/nvim-bin
export PATH=$PATH:$HOME/.config/yarn/global/node_modules/.bin
export PATH=$PATH:$HOME/.ghcup/env
export PATH=$PATH:$HOME/.ghcup/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:/opt/john
export PATH="$BUN_INSTALL/bin:$PATH"
[[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/raekh/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi
# }}}

# Oh My Posh {{{
if [ ! command -v oh-my-posh &> /dev/null ]; then
    sudo curl -s https://ohmyposh.dev/install.sh | sudo bash -s 
fi
if [ ! -d "$OHMYPOSH_HOME" ]; then
    mkdir -p "$(dirname $OHMYPOSH_HOME)"
    oh-my-posh config export --output $OHMYPOSH_HOME/base.toml --format toml 
fi
eval "$(oh-my-posh init zsh --config $OHMYPOSH_HOME/base.toml)"

function set_poshcontext() {
    export TUN0=$(ip -o -f inet addr show  | grep tun0 | awk '{print $4}' | awk -F/ '{print $1}')
}
# }}}

# Atuin {{{
eval "$(atuin init zsh)"
# }}}

# Bun completions {{{
[ -s "/home/$USER/.bun/_bun" ] && source "/home/$USER/.bun/_bun"
# }}}

# pnpm
export PNPM_HOME="/home/raekh/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Add to the end of ~/.zshrc
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

[ -f ~/.zshrc_env ] && source ~/.zshrc_env ]
