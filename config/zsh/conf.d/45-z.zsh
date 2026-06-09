# zoxide — "frecent" directory jumping (modern rust replacement for rupa/z).
# `--cmd z` keeps the familiar `z foo` syntax; `zi foo` opens an fzf picker.
# The database fills as you cd around once this is sourced.
if (( $+commands[zoxide] )); then
  eval "$(zoxide init zsh --cmd z)"
fi
