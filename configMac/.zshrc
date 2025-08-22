# --------------------------------------
# ZSH CONFIG PERSONALIZADO - ORVAR (macOS)
# --------------------------------------

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

# Detectar prefix de Homebrew (Apple Silicon por defecto)
export HOMEBREW_PREFIX="${HOMEBREW_PREFIX:-/opt/homebrew}"

# Plugins (macOS en vez de archlinux)
plugins=(
  git
  macos
  brew
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Tema (si luego quieres Starship, lo inicializamos al final)
# ZSH_THEME="robbyrussell"

source "$ZSH/oh-my-zsh.sh"

# --------------------------------------
# Historial
# --------------------------------------
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
HIST_STAMPS="yyyy-mm-dd"

# --------------------------------------
# Alias del sistema
# --------------------------------------
# ls moderno (lsd)
alias ls='lsd --icon always --group-dirs first'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

# Editor y recarga rapida
alias zshrc='code ~/.zshrc'
alias gitconfig='code ~/.gitconfig'
alias reload='source ~/.zshrc && echo "ZSH recargado correctamente."'

# --------------------------------------
# Utilidades modernas
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
alias gui='gitui'  # usa git-delta para diffs bonitos

# PDF/Imagen/Audio
alias pdftotxt='pdftotext'
alias pdfinfo='pdfinfo'
alias pdfimg='pdftoppm -png'
alias tojpg='convert'
alias audioconv='ffmpeg -i'
alias vid='ffmpeg -hide_banner'
alias img='feh .'  # feh via XQuartz no es ideal en mac, considera "qlmanage -p" o "open ."

# Python/Jupyter
alias python='python3'
alias pip='pip3'
alias jplab='jupyter lab --notebook-dir="$HOME/jupyterlab"'

# XAMPP (si lo tienes)
alias xampp='open -a xampp'

# --------------------------------------
# PATH limpio y ordenado (macOS)
# --------------------------------------
# usa el array 'path' de zsh y evita duplicados
typeset -U path PATH

# Homebrew binarios primero
path=("$HOMEBREW_PREFIX/bin" "$HOMEBREW_PREFIX/sbin" $path)

# Java (macOS): usa el helper oficial para JAVA_HOME
# Si tienes varias versiones, puedes fijar -v 21, 17, etc.
if command -v /usr/libexec/java_home >/dev/null 2>&1; then
  export JAVA_HOME="$(
    /usr/libexec/java_home 2>/dev/null \
    || echo ""
  )"
  if [[ -n "$JAVA_HOME" ]]; then
    path=("$JAVA_HOME/bin" $path)
  fi
fi

# Maven (instalado via brew)
if [[ -d "$HOMEBREW_PREFIX/opt/maven" ]]; then
  export M2_HOME="$HOMEBREW_PREFIX/opt/maven/libexec"
  path=("$M2_HOME/bin" $path)
fi

# Rutas utiles del sistema
path+=(
  "$HOME/.local/bin"
  "/usr/local/sbin"
  "/usr/local/bin"
  "/usr/bin"
  "/bin"
)

export PATH

# --------------------------------------
# FZF integracion (mejor que 'source <(fzf --zsh)')
# --------------------------------------
if [[ -f "$HOMEBREW_PREFIX/opt/fzf/shell/completion.zsh" ]]; then
  source "$HOMEBREW_PREFIX/opt/fzf/shell/completion.zsh"
fi
if [[ -f "$HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.zsh" ]]; then
  source "$HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.zsh"
fi
alias ff='fzf'
alias vf='nvim $(fzf)'
alias fh='history | fzf'

# --------------------------------------
# Integracion iTerm2 (si existe)
# --------------------------------------
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

# --------------------------------------
# Docker completions (macOS)
# --------------------------------------
fpath=("$HOME/.docker/completions" $fpath)
autoload -Uz compinit
compinit

# --------------------------------------
# Prompt Starship (opcional)
# --------------------------------------
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

# --------------------------------------
# Banner ASCII (opcional)
# Para no ensuciar la salida de scripts, solo si es interactive
# --------------------------------------
if [[ $- == *i* ]]; then
  echo " "
  echo "           ▄█     █▄     ▄████████  ▄█        ▄████████  ▄██████▄    ▄▄▄▄███▄▄▄▄      ▄████████       ▄██████▄     ▄████████  ▄█    █▄     ▄████████    ▄████████ "
  echo "          ███     ███   ███    ███ ███       ███    ███ ███    ███ ▄██▀▀▀███▀▀▀██▄   ███    ███      ███    ███   ███    ███ ███    ███   ███    ███   ███    ███ "
  echo "          ███     ███   ███    █▀  ███       ███    █▀  ███    ███ ███   ███   ███   ███    █▀       ███    ███   ███    ███ ███    ███   ███    ███   ███    ███ "
  echo "          ███     ███  ▄███▄▄▄     ███       ███        ███    ███ ███   ███   ███  ▄███▄▄▄          ███    ███  ▄███▄▄▄▄██▀ ███    ███   ███    ███  ▄███▄▄▄▄██▀ "
  echo "          ███     ███ ▀▀███▀▀▀     ███       ███        ███    ███ ███   ███   ███ ▀▀███▀▀▀          ███    ███ ▀▀███▀▀▀▀▀   ███    ███ ▀███████████ ▀▀███▀▀▀▀▀   "
  echo "          ███     ███   ███    █▄  ███       ███    █▄  ███    ███ ███   ███   ███   ███    █▄       ███    ███ ▀███████████ ███    ███   ███    ███ ▀███████████ "
  echo "          ███ ▄█▄ ███   ███    ███ ███▌    ▄ ███    ███ ███    ███ ███   ███   ███   ███    ███      ███    ███   ███    ███ ███    ███   ███    ███   ███    ███ "
  echo "           ▀███▀███▀    ██████████ █████▄▄██ ████████▀   ▀██████▀   ▀█   ███   █▀    ██████████       ▀██████▀    ███    ███  ▀██████▀    ███    █▀    ███    ███ "
  echo " "
fi

fastfetch

# --- Mostrar fetch segun sistema ---
if [[ "$(uname)" == "Darwin" ]]; then
  # macOS
  if command -v neofetch >/dev/null 2>&1; then
    neofetch
  fi
elif [[ "$(uname)" == "Linux" ]]; then
  # Linux
  if command -v fastfetch >/dev/null 2>&1; then
    fastfetch
  fi
fi
