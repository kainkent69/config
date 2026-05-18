# ... (Keep your P10k instant prompt block at the top)

# 1. Fix Go Path (Don't source the bin folder)
export GOPATH=$(go env GOPATH)
export PATH="$GOPATH/bin:$PATH"

# 2. Powerlevel10k Theme
source ~/powerlevel10k/powerlevel10k.zsh-theme

# 3. Aliases
alias bruno='~/.local/bin/bruno/squashfs-root/AppRun'
alias ls='eza --icons --group-directories-first --git'
alias ll='eza -lh --icons --group-directories-first --git'
alias la='eza -a --icons --group-directories-first --git'
alias cat='bat'
alias lg='lazygit'

# 4. P10k Config
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# 5. NVM
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# 6. Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# 7. Zed (Fixed syntax)
export PATH="$HOME/.local/bin/zed:$PATH"

# 8. Bun completions
[ -s "/home/lluie/.bun/_bun" ] && source "/home/lluie/.bun/_bun"

# 9. Modern CLI Tools
eval "$(zoxide init zsh)"
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
