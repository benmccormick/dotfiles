# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

autoload -Uz compinit
compinit
zstyle ':completion:*' autodescription 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
#zstyle ':completion:*' menu select=2 eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-comptctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:processes' list-colors '=(#b) $([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

zstyle ':completion:*' accept-exact '*(N)'

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache


# Setup zsh-autosuggestions
#source ~/.zsh/lib/autosuggestions/autosuggestions.zsh

# Enable autosuggestions automatically
# zle-line-init() {
#     zle autosuggest-start
# }
# zle -N zle-line-init

# # use ctrl+t to toggle autosuggestions(hopefully this wont be needed as
# # zsh-autosuggestions is designed to be unobtrusive)
bindkey '^T' autosuggest-toggle
