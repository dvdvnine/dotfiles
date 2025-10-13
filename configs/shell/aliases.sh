# Little more convenient to jump on dirs.
alias ..="cd .."
alias ...="cd ../.."

# Copy and paste as in macOS (required xclip).
alias pbcopy="xclip -selection clipboard"
alias pbpaste="xclip -selection clipboard -o"

# Sort directories in top, colors, and print "/" at directories, and human-readable size.
alias ls="ls -lhF --group-directories-first --color"

# Use syntax hightlight for bat (required bat package).
alias cat="bat --paging never --decorations never --plain"

# Copy public key to clipboard (required alias pbcopy).
alias pubkey="cat ~/.ssh/id_ed25519.pub | pbcopy | echo ' -> Public key copied to pasteboard.'"

