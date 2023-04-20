parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="\u@\h \[\e[34m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "

eval "$(/opt/homebrew/bin/brew shellenv)"

alias k='kubectl'
alias ll='ls -l'

eval "$(direnv hook bash)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash" || true


function iterm2_print_user_vars() {
    unset badge
    kubectl config current-context >/dev/null 2>&1 && {
      badge=$(kubectl config current-context)
    }
    iterm2_set_user_var badge "$badge"
}

complete -C /usr/local/bin/terraform terraform

complete -C /opt/homebrew/bin/terraform terraform

PATH=/opt/flux/flux:$PATH:/usr/local/bin

command -v flux >/dev/null && . <(flux completion bash)

