# Editors:
export EDITOR="$(which vim)"
export VISUAL="$(which vim)"

# Pagers:
export PAGER='less'

#   -i       smart case-insensitive search
#   -R       color
#   -F       exit if there is less than one page of content
#   -X       keep content on screen after exit
#   -M       show more info at the bottom prompt line
#   -x4      tabs are 4 instead of 8
export LESS='-iRXFMx4 --mouse --wheel-lines=3'

# Prompt:
export STARSHIP_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/starship/config.toml"

# Docker:
# Disable ads in CLI :(
export DOCKER_CLI_HINTS=false

# pip:
# pip should only run if there is a virtualenv currently activated.
export PIP_REQUIRE_VIRTUALENV=true

# Cache pip-installed packages to avoid re-downloading.
export PIP_DOWNLOAD_CACHE="$HOME/.pip/cache"

# Poetry:
# virtualenv inside the project.
export POETRY_VIRTUALENVS_IN_PROJECT=true
