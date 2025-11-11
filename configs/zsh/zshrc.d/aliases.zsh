# Create a dir and cd into it.
mkcd() {
  mkdir "${1}" && cd "${1}"
}

# Sort dirs in top, colors, and print "/" at dirs and human-readable size.
alias ls="ls -lhF --group-directories-first --color"

# Use syntax hightlight for bat (required bat package).
alias cat="bat --paging never --decorations never --plain"

# Copy and paste as in macOS (required xclip).
alias pbcopy="xclip -selection clipboard"
alias pbpaste="xclip -selection clipboard -o"

# Copy public key to clipboard (required alias pbcopy).
alias pubkey="cat ~/.ssh/id_ed25519.pub | pbcopy | echo ' -> Public key copied to pasteboard.'"

# Quick open .zshrc.
alias zshrc='${EDITOR:-vim} "${ZDOTDIR:-$HOME}"/.zshrc'

# Shortcut to lazygit.
alias lzg="lazygit"

# Shortcut to lazydocker.
alias lzd="lazydocker"
