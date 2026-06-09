# zsh completion system (compinit)
# oh-my-zsh used to run this; without it, NO tab-completion works (brew, git,
# gcloud, …). Must run after fpath is populated (Homebrew's shellenv in 10-
# already adds its site-functions) and before plugins that call `compdef`.

autoload -Uz compinit
compinit

# nicer completion UX
zstyle ':completion:*' menu select                       # arrow-key menu
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # case-insensitive

# include dotfiles in completion (e.g. `cat .z<Tab>` -> .zshrc)
# MUST come after compinit, which rebuilds _comp_options.
_comp_options+=(globdots)
