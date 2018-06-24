# softwares aliases
alias f="fortune"
alias fc="fortune | cowsay"
alias fp="fortune | ponysay"

alias rbtags="ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)"

alias gb='git branch'
alias gcm='git commit -m '
alias gcam='git commit -a -m '
alias gco='git checkout'
alias gp='git pull'
alias grev='git rev-parse HEAD | cut -c -7'
alias gs='git status'
# git fetch pull
gfpull () { git fetch && git checkout $1 && git pull origin $1; }
# git fetch push
gfpush () { git fetch && git checkout $1 && git push origin $1; }
# git track (create new tracking branch)
gt () { git checkout -b $1 -t origin/$1; }
# git version (tag and branch at a specific deploy point)
gv () { git tag v$1 && git checkout -b $1 && git push origin v$1 && git push origin $1; }
