# ENV VARIABLES
[ -f ~/.secrets ] && source ~/.secrets

# PATH DEPS
export PATH="/opt/homebrew/Cellar/llvm@11/11.1.0_4/bin:$PATH"
export PATH="/opt/homebrew/Cellar/llvm@12/12.0.1_1/bin:$PATH"
export PATH="/opt/homebrew/opt/binutils/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
# make sure ghcup comes first
export PATH="$HOME/.ghcup/bin:$PATH"

export JAVA_HOME=$(/usr/libexec/java_home -v 11.0.21)

export HOMEBREW_FILE="$HOME/.brewfile"

# COMPILE SETTINGS
export CPPFLAGS=" -I /opt/homebrew/include"
export LDFLAGS="-L /opt/homebrew/lib"
export C_INCLUDE_PATH="`xcrun --show-sdk-path`/usr/include/ffi:/opt/homebrew/Cellar/jpeg/9f/include"

# ZSH
export ZSH="$HOME/.oh-my-zsh"
export ZSH_HIGHLIGHT_MAXLENGTH=60

plugins=(git zsh-autosuggestions zsh-syntax-highlighting )
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
source $ZSH/oh-my-zsh.sh

# ZSH PROMPT - based on robbyrussel
autoload colors
PROMPT="%(?:%{$fg_bold[green]%}%1{%Bλ%b%} :%{$fg_bold[red]%}%1{%Bλ%b%} ) %{$fg[cyan]%}%B%c%b%{$reset_color%}"
PROMPT+=' $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[magenta]%}"
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
alias sshtp="ssh shost@$ZT_TP"
alias vf='fzf --print0 | xargs -0 -o nvim'
alias sp="cd $HOME/code/semester_project"
alias mp="cd $HOME/Documents/master_thesis"
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'

# GLOBAL
alias -g pc="simon@$PC_HOME"
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env


# FUNCTIONS
function swap()         
{
    local TMPFILE=tmp.$$
    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}

function gfix()
{
    if [ -z "$1" ]; then
        echo "usage: gfix <commit>" >&2
        return 1
    fi

    local target
    target=$(git rev-parse --verify "$1^{commit}") || return 1

    git commit --fixup="$target" || return 1

    if git rev-parse --verify -q "$target^" >/dev/null; then
        GIT_SEQUENCE_EDITOR=: git rebase -i --autosquash "$target^"
    else
        GIT_SEQUENCE_EDITOR=: git rebase -i --autosquash --root
    fi
}

# KEYBINDINGS
bindkey "^[[1;3D" backward-word
bindkey "^[[1;3C" forward-word
