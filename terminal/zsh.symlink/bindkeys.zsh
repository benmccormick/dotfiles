# Get nice up and down searching based on command
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# Fix for home/end keys
if [[ "$TERM" != emacs ]]; then
[[ -z "$terminfo[kdch1]" ]] || bindkey -M emacs "$terminfo[kdch1]" 
[[ -z "$terminfo[khome]" ]] || bindkey -M emacs "$terminfo[khome]" 
[[ -z "$terminfo[kend]" ]] || bindkey -M emacs "$terminfo[kend]" 
[[ -z "$terminfo[kich1]" ]] || bindkey -M emacs "$terminfo[kich1]" 
[[ -z "$terminfo[kdch1]" ]] || bindkey -M vicmd "$terminfo[kdch1]" 
[[ -z "$terminfo[khome]" ]] || bindkey -M vicmd "$terminfo[khome]" 
[[ -z "$terminfo[kend]" ]] || bindkey -M vicmd "$terminfo[kend]" 
[[ -z "$terminfo[kich1]" ]] || bindkey -M vicmd "$terminfo[kich1]" 
[[ -z "$terminfo[cuu1]" ]] || bindkey -M viins "$terminfo[cuu1]" 
[[ -z "$terminfo[cuf1]" ]] || bindkey -M viins "$terminfo[cuf1]" 
[[ -z "$terminfo[kcuu1]" ]] || bindkey -M viins "$terminfo[kcuu1]" 
[[ -z "$terminfo[kcud1]" ]] || bindkey -M viins "$terminfo[kcud1]" 
[[ -z "$terminfo[kcuf1]" ]] || bindkey -M viins "$terminfo[kcuf1]" 
[[ -z "$terminfo[kcub1]" ]] || bindkey -M viins "$terminfo[kcub1]" 
fi
