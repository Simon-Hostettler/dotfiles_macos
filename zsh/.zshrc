# ENV VARIABLES
[ -f ~/.secrets ] && source ~/.secrets

# PATH DEPS
export PATH="/opt/homebrew/Cellar/llvm@11/11.1.0_4/bin:$PATH"
export PATH="/opt/homebrew/Cellar/llvm@12/12.0.1_1/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export JAVA_HOME=$(/usr/libexec/java_home -v 11.0.21)

export HOMEBREW_FILE="$HOME/.brewfile"

# COMPILE SETTINGS
export CPPFLAGS=" -I /opt/homebrew/include"
export LDFLAGS="-L /opt/homebrew/lib"
export C_INCLUDE_PATH="`xcrun --show-sdk-path`/usr/include/ffi"

# ZSH
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="robbyrussell"
export ZSH_HIGHLIGHT_MAXLENGTH=60

plugins=(git zsh-autosuggestions zsh-syntax-highlighting )
source $ZSH/oh-my-zsh.sh

ZSH_AUTOSUGGEST_STRATEGY=(history completion)


# ALIASES
alias cat="bat"
alias ga="git add -u"
alias gc="git commit -m"
alias sshpc="ssh simon@$PC_HOME"
alias sshpi="ssh simon@$PI_HOME"

[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

