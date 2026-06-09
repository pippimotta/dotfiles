# Git aliases & helpers

alias gst="git status"
alias ga="git add"
alias gc="git commit"
alias gl="git clone"
alias gf="git diff master"
alias gp="git push"
alias gpl="git pull"
alias glo="git log --oneline"
alias gres="git restore"
alias gs='git switch'
alias gsm="git switch master"
alias gsc="git switch -c"
alias gu='git reset --soft HEAD~1'          # undo last commit, keep changes staged
alias dummy="git commit --allow-empty -m 'dummy commit'"
alias typo="git commit --amend --no-edit"   # amend without changing the message

# pretty graph log
alias glog='git log --graph --pretty=format:'\''%Cred%h%Creset %Cgreen(%cr)%Creset%Cblue[%an]%Creset %s%Creset%C(yellow)%d%Creset'\'' --abbrev-commit --date=relative'

# fuzzy-checkout a branch (needs fzf)
# `sed 's/^[* ]*//'` strips the leading "* " marker so the current branch
# selects cleanly instead of expanding to `git checkout *`.
alias br='git checkout $(git branch | fzf --cycle --border --ansi | sed '\''s/^[* ]*//'\'')'
