#!/usr/bin/env bash
#
# Bootstrap these dotfiles on a fresh Mac:
#   1. install Homebrew (if missing) + the CLI tools the config relies on
#   2. symlink the tracked config into ~/.config and ~/.zshenv
#   3. create a machine-local git identity file (prompts)
#
# Safe to re-run. Usage:  ./install.sh
#
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
info() { printf '\033[1;36m==>\033[0m %s\n' "$1"; }

# --- 1. Homebrew + tools ----------------------------------------------------
if ! command -v brew >/dev/null 2>&1; then
  info "Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
if [[ -x /opt/homebrew/bin/brew ]]; then eval "$(/opt/homebrew/bin/brew shellenv)";
elif [[ -x /usr/local/bin/brew ]]; then eval "$(/usr/local/bin/brew shellenv)"; fi

info "Installing CLI tools"
brew install \
  git gh \
  starship fzf ripgrep zoxide bat neovim \
  zsh-autosuggestions zsh-syntax-highlighting \
  kubectl kubectx

info "Installing GUI apps (casks)"
brew install --cask ghostty google-chrome

# --- 2. symlinks ------------------------------------------------------------
link() {  # link <repo-relative-source> <absolute-dest>
  local src="$REPO/$1" dest="$2"
  mkdir -p "$(dirname "$dest")"
  if [[ -e "$dest" && ! -L "$dest" ]]; then
    mv "$dest" "$dest.bak.$(date +%s)"
    info "Backed up existing $dest"
  fi
  ln -sfn "$src" "$dest"
  echo "  $dest -> $src"
}

info "Linking config"
mkdir -p "$HOME/.local/bin"
link home/.zshenv            "$HOME/.zshenv"
link config/zsh/.zshrc       "$HOME/.config/zsh/.zshrc"
link config/zsh/conf.d       "$HOME/.config/zsh/conf.d"
link config/starship.toml    "$HOME/.config/starship.toml"
link config/git/config       "$HOME/.config/git/config"
link config/ghostty/config   "$HOME/.config/ghostty/config"

# --- 3. machine-local git identity -----------------------------------------
local_git="$HOME/.config/git/config.local"
if [[ ! -e "$local_git" ]]; then
  info "Creating $local_git"
  name=""; email=""
  if [[ -t 0 ]]; then
    read -rp "git user.name (blank to skip): " name || true
    [[ -n "$name" ]] && { read -rp "git user.email: " email || true; }
  fi
  {
    echo "# Machine-specific git identity — NOT tracked."
    echo "[user]"
    [[ -n "$name"  ]] && echo "	name = $name"
    [[ -n "$email" ]] && echo "	email = $email"
  } > "$local_git"
fi

info "Done. Open a new terminal, or run:  exec zsh"
[[ "${SHELL:-}" != *zsh ]] && info "Login shell isn't zsh — set it with:  chsh -s /bin/zsh"
