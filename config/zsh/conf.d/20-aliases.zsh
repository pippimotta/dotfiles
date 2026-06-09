# General aliases

# --- tmux ---
alias ta='tmux attach'
alias td='tmux detach'
alias tt='tmux'

# --- directory navigation ---
alias ww='cd ~/Desktop/Arbeit'     # was './Desktop/Arbeit' (only worked from $HOME) -> absolute
alias qq='cd ~/Desktop/lernen'
alias 'cd..'='cd ..'
alias '...'='cd ../..'

# --- docker ---
alias dcd="docker compose down"
alias dcu="docker compose up"

# --- common ---
alias ll="ls -al"
alias cl="clear"
alias q="exit"
alias py="python3"
alias bi="brew install"
alias cc="claude"
alias vi="nvim"
alias grep='grep --color=auto -n'  # note: old config also had `grep=rg`, which this overrode
alias sed='sed -E'

# --- lint ---
alias glint="golangci-lint"
# (Mercari php-cs-fixer `lint` alias lives in 50-mercari.local.zsh)

# --- process / port helpers (need fzf) ---
# list listening sockets, pick one in fzf
alias ports="lsof -Pn -i | awk '{printf \"%10s %6s %5s %4s %-20s\n\", \$1, \$2, \$3, \$8, \$9}' | fzf --border --cycle --ansi --header-lines=1"

# fuzzy-pick processes and kill them (fkill [signal], default 9)
fkill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
  if [ "x$pid" != "x" ]; then
    echo $pid | xargs kill -${1:-9}
  fi
}

# --- edit this config ---
# (renamed from old `alias zsh=...`, which shadowed the `zsh` command itself)
alias zshrc='${EDITOR:-vi} ~/.config/zsh/.zshrc'
alias zshconf='cd ~/.config/zsh'
