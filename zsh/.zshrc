# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [ -f "$HOME/.env" ]; then
	set -o allexport
	source "$HOME/.env"
	set +o allexport
fi


# If you come from bash you might have to change your $PATH.
# Path to your Oh My Zsh installation.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export PATH="/opt/docker-desktop/bin:$PATH"
export PATH="/opt/nvim-linux64/bin:$PATH"
export PATH="$PATH:/usr/pgadmin4/bin"
export PATH="$PATH:/opt/maple2022/bin"
export PATH="$PATH:/home/jae/.cargo/bin"
export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/go/bin:$PATH"
# Use fd instead of find (respects .gitignore, ignores .git)
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export EDITOR=nvim
export SUDO_EDITOR=nvim
# Apply to Ctrl+T
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
# Less: good defaults for logs
export LESS='-R -F -X -M'
export LESSCHARSET='utf-8'
# A generic fast CDN mirror
export UV_INDEX_URL="https://pypi.org/simple"

# OR: If you are in a specific region, find a local mirror.
# Example (University mirrors are often blazing fast):
# export UV_INDEX_URL="https://mirror.accum.se/mirror/pypi.org/simple"
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
plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
# Source fzf keybindings and completion
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
# User configuration

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
#
#










# General Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='lsd -alF'
alias la='lsd -A'
alias l='lsd -CF'
alias ls='lsd'
# Custom Aliases
alias szrc="source ~/.zshrc"
alias zrc="nvim ~/.zshrc"
alias ncf="nvim ~/.config/nvim/init.vim"
alias docs="cd ~/Documents"
alias desk="cd ~/Desktop"
alias cpy="wl-cpy"
alias dps='docker ps -a --format "table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Names}}"'
alias sv="source .venv/bin/activate"
alias nv="nvim"




# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#suppres warnnings 
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off


eval "$(atuin init zsh --disable-up-arrow)"
eval "$(zoxide init zsh)"



# Force block cursor in Zsh
# We hook into the line editor (zle-line-init) to ensure the block
# is applied every time you start typing a new command.
function _force_block_cursor() {
    echo -ne '\e[2 q'
}

# 1. Run immediately on load
_force_block_cursor

# 2. Force it every time the line editor initializes
zle -N zle-line-init _force_block_cursor

# Custom Syntax Highlighting Colors (Vesper Gold)
# ZSH_HIGHLIGHT_STYLES[command]='fg=#FFC799,bold'
# ZSH_HIGHLIGHT_STYLES[alias]='fg=#FFC799,bold'
# ZSH_HIGHLIGHT_STYLES[builtin]='fg=#FFC799,bold'
# ZSH_HIGHLIGHT_STYLES[function]='fg=#FFC799,bold'
