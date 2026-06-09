# fzf shell integration (key bindings + completion)
# Provides:
#   Ctrl-R  fuzzy search through command history
#   Ctrl-T  paste a fuzzy-selected file/dir path into the line
#   Alt-C   cd into a fuzzy-selected subdirectory
# `fzf --zsh` (fzf >= 0.48) emits the binding + completion script inline,
# so there's nothing to source from a fixed path.
if (( $+commands[fzf] )); then
  eval "$(fzf --zsh)"

  # Default look: match the --border --cycle --ansi style used elsewhere.
  export FZF_DEFAULT_OPTS='--height=40% --layout=reverse --border --cycle --ansi'

  # Use ripgrep as the file source (follows symlinks, includes hidden files,
  # ignores VCS-ignored paths but skips node_modules/.git noise).
  if (( $+commands[rg] )); then
    export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*}"'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  fi

  # Ctrl-T: preview the file with bat (syntax highlighting + line numbers).
  if (( $+commands[bat] )); then
    export FZF_CTRL_T_OPTS='--preview "bat --color=always --style=numbers --line-range=:500 {}"'
  fi
fi
