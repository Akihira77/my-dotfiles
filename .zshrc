# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

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
ENABLE_CORRECTION="true"

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
    aliases
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
alias ldock="lazydocker"
alias lgit="lazygit"
#



# Fungsi fuzzy finder di /home, buka file/dir hasilnya
fuzzy_find_home() {
  local dir
  dir=$(find /home -type d 2>/dev/null | fzf +m)
  if [[ -n $dir ]]; then
    cd "$dir"
    zle accept-line
  fi
}

# Fungsi fuzzy finder di /home/akihira17/programming, buka file/dir hasilnya
fuzzy_find_programming() {
  local dir
  dir=$(find /home/akihira17/programming -type d 2>/dev/null | fzf +m)
  if [[ -n $dir ]]; then
    cd "$dir"
    zle accept-line
  fi
}

# Fungsi buka nvim di direktori sekarang
nvim_open_cwd() {
  nvim .
}

# Bind Ctrl+F ke fungsi fuzzy_find_home
zle -N fuzzy_find_home
bindkey '^F' fuzzy_find_home

# Bind Ctrl+P ke fungsi fuzzy_find_programming
zle -N fuzzy_find_programming
bindkey '^P' fuzzy_find_programming

# Bind Ctrl+N ke fungsi buka nvim .
zle -N nvim_open_cwd
bindkey '^N' nvim_open_cwd

# Bind Ctrl+O untuk jalankan tmux
autoload -U add-zsh-hook

open_tmux() {
    (
        exec </dev/tty
        exec <&1
        tmux attach || tmux
    )
}

zle -N open_tmux
bindkey '^O' open_tmux


eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH=$PATH:/usr/local/go/bin
export PATH="$(go env GOPATH)/bin:$PATH"
export PATH="/home/akihira17/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/home/akihira17/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

# pnpm
export PNPM_HOME="/home/akihira17/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# opencode
export PATH=/home/akihira17/.opencode/bin:$PATH
export NVIDIA_API_KEY='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'

# Opencode tmux floating-window session manager
opencode-tmux-session() {
  local action="${1:-prompt}"

  case "$action" in
    new|n)
      opencode --port ;;
    continue|c)
      opencode --port --continue ;;
    list|l)
      local sid
      sid=$(opencode session list | tail -n +3 | fzf --height=40% --reverse | awk '{print $1}')
      [[ -n "$sid" ]] && opencode --port --session "$sid" ;;
    prompt|*)
      echo "[n]ew  [c]ontinue  [l]ist"
      read -k1 "choice?→ "
      echo
      case "$choice" in
        n|N) opencode --port ;;
        c|C) opencode --port --continue ;;
        l|L)
          local sid
          sid=$(opencode session list | tail -n +3 | fzf --height=40% --reverse | awk '{print $1}')
          [[ -n "$sid" ]] && opencode --port --session "$sid" ;;
      esac
      ;;
  esac
}

# Dotfiles bare git repo
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# Aliases
alias oco='opencode --port'
alias occ='opencode --port --continue'
alias ocs='opencode --port --session'
alias oss='opencode-session-search'

# List sessions with fzf, copy session ID to clipboard on select
unalias ocl 2>/dev/null
ocl() {
  local sid
  sid=$(opencode session list | tail -n +3 | fzf --height=40% --reverse | awk '{print $1}')
  if [[ -n "$sid" ]]; then
    echo -n "$sid" | clip.exe
    echo "Session $sid copied"
    echo "ocs $sid"
  fi
}
