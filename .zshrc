# --- History ---
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY

# --- Plugins ---
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# --- Aliases ---
alias grep='grep --color=auto'
alias update='paru -Syu'
alias cleanup='paru -Sc'
alias cfg='cd ~/.config'
alias dotfiles='~/dotfiles/backup.sh'

# --- Prompt ---
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' (%b)'
setopt PROMPT_SUBST

PROMPT='%F{#E87FA0}╭─ %F{#F7AABC}%~%F{#F0C060}${vcs_info_msg_0_}%f
%F{#E87FA0}╰─%(?.%F{#E87FA0}.%F{#E94B67})❯%f '

# --- Better defaults ---
alias ls='eza --icons'
alias ll='eza -lah --icons'
alias lt='eza --tree --icons'
alias cat='bat'
alias f='yazi'

# --- Initialize zoxide ---
eval "$(zoxide init zsh)"

# --- fzf colors ---
export FZF_DEFAULT_OPTS="
  --color=bg+:#1a1a1a,bg:#000000,spinner:#E87FA0,hl:#E94B67
  --color=fg:#F7AABC,header:#E94B67,info:#F0C060,pointer:#E87FA0
  --color=marker:#F7AABC,fg+:#F7AABC,prompt:#E87FA0,hl+:#E94B67
  --border rounded
  --height 40%"

# ---fzf keybindings ---
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# --- Sudoedit ---
export SUDO_EDITOR=nvim
