# Bash prompt values not supported for zshrc. Use following snippet to set the prompt

function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

COLOR_DEF=$'%f'
COLOR_DIR=$'%F{243}'
COLOR_GIT=$'%F{39}'
setopt PROMPT_SUBST
export PROMPT='$(virtualenv_info)${COLOR_DIR}%C${COLOR_GIT}$(parse_git_branch)${COLOR_DEF}$ '
