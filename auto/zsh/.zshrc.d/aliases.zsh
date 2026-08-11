# Create a dir and cd into it.
mkcd() {
  mkdir -p -- "$1" && cd -- "$1"
}

# Sort dirs in top, colors, and print `/` at dirs:
alias ls="\
  env EZA_COLORS=uu=0:uR=0:un=0:gu=0:gR=0:gn=0:sn=0:sb=0:da=0 \
  eza --group-directories-first --classify=always --sort=name -l"

alias tree="\
  env EZA_COLORS=uu=0:uR=0:un=0:gu=0:gR=0:gn=0:sn=0:sb=0:da=0 \
  eza --group-directories-first --classify=always --sort=name -T"

# Only syntax highlight (required 'bat' package).
alias cat="bat --plain"
