# Get nice up and down searching based on command
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
# vi mode!
bindkey -v
# Fix backspace key for vi mode
bindkey "^?" backward-delete-char
# Accept auto suggestions
bindkey '^f' vi-forward-blank-word

