# Path to your oh-my-zsh installation.
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
ZSH_THEME="robbyrussell"

# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  z
  zsh-autosuggestions
  zsh-syntax-highlighting
  you-should-use
  zsh-history-substring-search
)

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

source $ZSH/oh-my-zsh.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# Fzf keybind
export FZF_DEFAULT_OPTS="
  --border
  --layout reverse 
  --prompt '∷ '
  --pointer ▶ 
  --marker ⇒
  --color=border:#808080,spinner:#E6DB74,hl:#7E8E91,fg:#F8F8F2,header:#7E8E91,info:#A6E22E,pointer:#A6E22E,marker:#F92672,fg+:#F8F8F2,prompt:#F92672,hl+:#F92672"

export FZF_CTRL_T_OPTS="
  --height 60%
  --preview 'bat --color=always --style=numbers {}'
  --bind 'focus:transform-header:file --brief {}'
  "

export FZF_CTRL_R_OPTS="
  --height 60%
  --preview 'echo {}'
  "

export FZF_ALT_C_COMMAND="fd --type directory --exclude venv --exclude virtualenv --exclude .git"
export FZF_ALT_C_OPTS="--preview 'tree -C {}'"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# load .zsh_profile
if [ -f ~/.zsh_profile ]; then
  source ~/.zsh_profile
fi

eval $(keychain --eval --quiet id_ed25519)

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
