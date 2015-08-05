# Get nice up and down searching based on command
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
# vi mode!
bindkey -v
# Fix backspace key for vi mode
bindkey "^?" backward-delete-char
# Accept auto suggestions
bindkey '^f' vi-forward-blank-word
# Search backwards and forwards with a pattern
bindkey -M vicmd '/' history-incremental-search-backward
bindkey -M vicmd '?' history-incremental-search-forward

# set up for insert mode too
bindkey -M viins '^R' history-incremental-search-backward
bindkey -M viins '^F' history-incremental-search-forward
