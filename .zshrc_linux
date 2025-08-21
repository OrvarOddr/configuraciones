# --------------------------------------
# 💡 ZSH CONFIG PERSONALIZADO - ORVAR
# --------------------------------------

# --- Variables base ---
export ZSH="$HOME/.oh-my-zsh"

plugins=(
  git
  archlinux
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# --- Historial ZSH ---
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
HIST_STAMPS="yyyy-mm-dd"  # formato de fecha en el historial

# --- Opciones recomendadas ---
# HYPHEN_INSENSITIVE="true"  # Autocompletado trata "-" y "_" igual
# ENABLE_CORRECTION="true"   # Corrige comandos mal escritos
# COMPLETION_WAITING_DOTS="true"  # Indicador visual mientras completa


# --------------------------------------
# ⚙️ ALIAS DEL SISTEMA
# --------------------------------------

# Ls moderno con lsd
alias ls='lsd --icon always --group-dirs first'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

# Editor y recarga
alias zshrc='code ~/.config/zsh/.zshrc'
alias gitconfig='code ~/.gitconfig'
alias reload='source ~/.config/zsh/.zshrc && echo "🔄 ZSH recargado correctamente."'


# --------------------------------------
# 🔧 UTILIDADES MODERNAS
# --------------------------------------

alias cat='bat'
alias find='fd'
alias du='dust'
alias df='dua'
alias top='btm'
alias y='yazi'
alias n='nnn'
alias bb='broot'
alias zz='zellij'
alias man='tldr'
alias cheat='navi'
alias lg='lazygit'
alias gui='gitui' # Usar delta Para diff sudo pacman -S git-delta

# --------------------------------------
# 🧠 FZF Búsqueda Inteligente
# --------------------------------------

source <(fzf --zsh)
alias ff='fzf'
alias vf='nvim $(fzf)'
alias fh='history | fzf'

# --------------------------------------
# 🐙 GIT Pro
# --------------------------------------

alias gs='git status'
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push'
alias gco='git checkout'
alias gl='git log --oneline --graph --decorate --all'

# --------------------------------------
# 📄 PDF, IMAGEN Y AUDIO
# --------------------------------------

alias pdftotxt='pdftotext'
alias pdfinfo='pdfinfo'
alias pdfimg='pdftoppm -png'
alias tojpg='convert'
alias audioconv='ffmpeg -i'
alias vid='ffmpeg -hide_banner'
alias img='feh .'


# ==========================
# PATH limpio y ordenado
# ==========================




export JAVA_HOME="/usr/lib/jvm/default"
path=("$JAVA_HOME/bin" $path)typeset -U path
path=(
  $HOME/.local/bin
  $HOME/.local/share/JetBrains/Toolbox/scripts
  /usr/local/sbin
  /usr/local/bin
  /usr/bin
  /bin
  $HOME/.local/share/flatpak/exports/bin
  /var/lib/flatpak/exports/bin
  $HOME/.local/lib/hyde
)
export PATH


export JAVA_HOME="/usr/lib/jvm/default"
path=("$JAVA_HOME/bin" $path)