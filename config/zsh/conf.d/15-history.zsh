# History configuration
# Docs: https://zsh.sourceforge.io/Guide/zshguide02.html (section 2.5.5)

SAVEHIST=10000                  # commands kept in the history file
HISTSIZE=10000                  # lines the shell keeps for one session
HISTFILE="$ZDOTDIR/.zsh_history"  # was ~/.zsh_history; kept inside ZDOTDIR for a tidy $HOME

setopt APPEND_HISTORY          # append instead of overwriting
setopt HIST_EXPIRE_DUPS_FIRST  # drop duplicates first when the file exceeds HISTSIZE
setopt HIST_VERIFY             # expand history refs (e.g. !!) instead of running immediately
setopt SHARE_HISTORY           # share history across running sessions
setopt EXTENDED_HISTORY        # record timestamp + duration (list with `history -Di`)
setopt HIST_ALLOW_CLOBBER      # auto-insert >| for clobbering redirections
setopt HIST_IGNORE_SPACE       # don't record commands that start with a space
setopt HIST_NO_STORE           # don't record `history`/`fc` themselves
