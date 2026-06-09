# Language toolchains

# --- Go ---
# GOPATH defaults to ~/go and GOBIN to $GOPATH/bin already; the only thing
# worth doing here is putting go-installed binaries on PATH so tools fetched
# with `go install` are runnable directly.
if (( $+commands[go] )); then
  export GOPATH="$HOME/go"
  export GOBIN="$GOPATH/bin"
  export PATH="$GOBIN:$PATH"
fi

# --- pyenv ---  (no-op until `brew install pyenv`)
# Manages multiple Python versions; the init lines set up shims that route
# python/pip to the selected version, plus shell hooks for `pyenv shell` etc.
if (( $+commands[pyenv] )); then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi
