#essa é minha config do ho my zsh com os alias que mais gosto de usar 


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
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
plugins=(git)

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
# alias ohmyzsh="mate ~/.oh-my-zsh"





# Ativar o autocomplete e as cores (caminhos do Arch)
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Inicializar o zoxide (o 'cd' inteligente)
eval "$(zoxide init zsh)"

#source /usr/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# Caminho exato conforme o seu 'pacman -Ql'
source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# 3. A mágica do TAB: Aceitar a sugestão cinza
# No Zsh, '^I' representa a tecla TAB
bindkey '^I' autosuggest-accept

# 4. Estratégia de sugestão (Priorizar o histórico)
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
#git alias 
alias gi='git init'
alias gs='git status'
alias gc='git clone'
#lista todos os repositorios do meu git 
alias gitlist='gh repo list --json url,name --jq ".[] | \"\(.name): \(.url)\""'
#cria um repositorio publico na pasta atual e ja adiciona ao git hub
alias gitfast='gh repo create --public --source=. --remote=origin --push'
#cria novo repositorio 
alias gitnew='gh repo create'
#editar um repositorio
alias gitedit = 'gh repo edit'  



alias pa='php artisan'

# Compila e já executa o programa logo em seguida
function compile() {
    gcc "$1" -o "${1%.*}" && ./"${1%.*}"
}

source ~/powerlevel10k/powerlevel10k.zsh-theme
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# --- Player de Mídia ---
v() {
    local arquivo="$1"
    if [[ -f "$arquivo" ]]; then
        local extensao="${arquivo:e:l}"
        case "$extensao" in
            jpg|jpeg|png|gif|webp|svg|bmp)
                echo "🖼️ Abrindo imagem..."
                xdg-open "$arquivo" >/dev/null 2>&1 &
                ;;
            mp4|mkv|mov|avi|flv|webm)
                echo "🎬 Abrindo vídeo..."
                xdg-open "$arquivo" >/dev/null 2>&1 &
                ;;
            *)
                echo "❌ Arquivo .$extensao não suportado."
                ;;
        esac
    else
        echo "⚠️ Arquivo não encontrado."
    fi
}
