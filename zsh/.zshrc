# ENV VARIABLES
[ -f ~/.secrets ] && source ~/.secrets

# PATH DEPS
export PATH="/opt/homebrew/Cellar/llvm@11/11.1.0_4/bin:$PATH"
export PATH="/opt/homebrew/Cellar/llvm@12/12.0.1_1/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
# make sure ghcup comes first
export PATH="$HOME/.ghcup/bin:$PATH"

export JAVA_HOME=$(/usr/libexec/java_home -v 11.0.21)

export HOMEBREW_FILE="$HOME/.brewfile"

# COMPILE SETTINGS
export CPPFLAGS=" -I /opt/homebrew/include"
export LDFLAGS="-L /opt/homebrew/lib"
export C_INCLUDE_PATH="`xcrun --show-sdk-path`/usr/include/ffi"

# ZSH
export ZSH="$HOME/.oh-my-zsh"
export ZSH_HIGHLIGHT_MAXLENGTH=60

plugins=(git zsh-autosuggestions zsh-syntax-highlighting )
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
source $ZSH/oh-my-zsh.sh

# ZSH PROMPT
autoload colors
PROMPT="%(?:%{$fg_bold[green]%}%1{%Bλ%b%} :%{$fg_bold[red]%}%1{%Bλ%b%} ) %{$fg[cyan]%}%B%c%b%{$reset_color%}"
PROMPT+=' $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# FZF
export FZF_DEFAULT_COMMAND="fd --type f --strip-cwd-prefix --exclude .git --ignore-file $HOME/.config/fd/.ignore"
export FZF_DEFAULT_OPTS="--preview 'bat --color=always {}'"

# ALIASES
alias cat="bat"
alias ga="git add -u"
alias gc="git commit -m"
alias sshpc="ssh simon@$PC_HOME"
alias sshpi="ssh simon@$PI_HOME"
alias vf='fzf --print0 | xargs -0 -o nvim'

[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

