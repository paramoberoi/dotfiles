# Enable vi mode in zsh (must be before starship init)
bindkey -v
export KEYTIMEOUT=1

# Starship prompt
eval "$(starship init zsh)"

# Make Neovim the default editor
export EDITOR=nvim
export SUDO_EDITOR=nvim

# Save history with timestamp
HISTFILE=~/.history
HISTSIZE=10000
SAVEHIST=50000

setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST

# Aliases
alias v="nvim"
alias c="clear"

# zsh functions directory to make poetry completions work
fpath+=~/.zfunc
autoload -Uz compinit && compinit

export PATH="/Users/poberoi/.local/bin:$PATH"

# Add Homebrew to PATH
export PATH="/opt/homebrew/bin:$PATH"

# Add pyenv to PATH
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# Initialize pyenv
eval "$(pyenv init -)"

#This is to make Github Copilot work
# export NODE_EXTRA_CA_CERTS=~/Documents/Code/caadmin.netskope.com.pem
# export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"

# For Go private repos
export GOPRIVATE=github.intuit.com

#Setup fzf key bindings and fuzzy complete
source <(fzf --zsh)

# fzf-tab
autoload -U compinit; compinit
source ~/.config/fzf-tab/fzf-tab.plugin.zsh

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(zoxide init zsh --cmd cd)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/poberoi/Documents/DDE/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/poberoi/Documents/DDE/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/poberoi/Documents/DDE/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/poberoi/Documents/DDE/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(/opt/homebrew/bin/brew shellenv)"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-11.jdk/Contents/Home

# bun completions
[ -s "/Users/poberoi/.bun/_bun" ] && source "/Users/poberoi/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"

export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
