# dotfiles

Personal zsh / git / prompt setup. XDG-first, `ZDOTDIR` + drop-in `conf.d` layout, no oh-my-zsh.

## Install (fresh Mac)

```sh
git clone git@github.com:pippimotta/dotfiles.git ~/dotfiles
~/dotfiles/install.sh
exec zsh
```

`install.sh` installs Homebrew + CLI tools, symlinks the config into place (backing up
anything already there), and creates a machine-local git identity file.

## Layout

```
home/.zshenv                 bootstrap: sets ZDOTDIR -> ~/.config/zsh
config/zsh/.zshrc            sources conf.d/*.zsh in order
config/zsh/conf.d/           drop-in modules, number-prefixed for load order
  00-path 05-env 10-homebrew 15-history 18-options 19-completion
  20-aliases 30-git 35-langs 40-fzf 45-z 55-kubectl
  80-autosuggestions 90-prompt 99-syntax-highlighting
config/starship.toml         minimal, emoji-free prompt
config/git/config            git settings; identity is layered in via include
```

Symlinked into `~/.zshenv`, `~/.config/zsh/.zshrc`, `~/.config/zsh/conf.d`,
`~/.config/starship.toml`, `~/.config/git/config`.

## Tools

starship · fzf · ripgrep · zoxide · bat · neovim · zsh-autosuggestions ·
zsh-syntax-highlighting · kubectl · kubectx

## Machine-specific / secrets

Anything not portable stays **out of git**:

- `~/.config/zsh/conf.d/*.local.zsh` — per-machine shell config (e.g. work-only
  aliases). Sourced automatically; gitignored.
- `~/.config/git/config.local` — git identity & signing, pulled in by
  `config/git/config` via `[include]`. Created per machine by `install.sh`.
- Secrets (API keys/tokens) go in a `*.local.zsh`, never in a tracked file.
