# Location prompt configuration.
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

# pip should only run if there is a virtualenv currently activated.
export PIP_REQUIRE_VIRTUALENV=true

# Cache pip-installed packages to avoid re-downloading.
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache


eval "$(starship init zsh)"
