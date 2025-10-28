# Lazy-load antidote from its functions directory.
fpath=("${ZDOTDIR:-$HOME}/.antidote/functions" $fpath)
autoload -Uz antidote

# Set the root name of the plugins files (.txt and .zsh) antidote will use.
_zsh_plugins="${ZDOTDIR:-$HOME}/.zsh_plugins"

# Generate a new static file whenever .zsh_plugins.txt is updated.
if [[ ! ${_zsh_plugins}.zsh -nt ${_zsh_plugins}.txt ]]; then
  antidote bundle <${_zsh_plugins}.txt >|${_zsh_plugins}.zsh
fi

# Source your static plugins file.
source ${_zsh_plugins}.zsh

unset _zsh_plugins
