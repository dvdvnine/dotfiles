status is-interactive; or return 0

set -g fish_greeting
set -g fish_key_bindings fish_vi_key_bindings

starship init fish | source
zoxide init fish | source
fzf --fish | source
mise activate fish | source
