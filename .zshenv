export PYENV_ROOT="$HOME/.pyenv"
[[ -d "$PYENV_ROOT/bin" ]] && export PATH="$PYENV_ROOT/bin:$PATH"
. "$HOME/.cargo/env"

# uv
export PATH="$HOME/.local/bin:$PATH"
