# General export
export GOPATH="/usr/bin/go"
export PATH="~/workspace/tools/activator/bin:$PATH"
export EDITOR=vim:

# ENV aliases
alias src="source ~/.bash_profile"
alias f="fortune"
alias fc="fortune | cowsay"
#alias vim="nvim"

# Git aliases
alias ad="git add -A"
alias cm="git commit -m ${1}"
alias push="git push"
alias st="git status"
alias bd="git diff --name-status ${1}"
alias df="git difftool ${1}"
alias lg="git log --oneline --decorate ${1}"

# Git configuration
# Branch name in prompt
source ~/.git-prompt.sh
PS1=$'\e[0;32m\e[1m\u2794  \W$(__git_ps1 " (%s)")\e[0m\e[m '
export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'
# Tab completion for branch names
source ~/.git-completion.bash
