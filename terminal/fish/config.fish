# Ben McCormick's fish config

#Aliases
alias vim="mvim -v"

set PATH ~/Code/Windsor/test/bin /Library/PostgreSQL/9.3/bin $PATH

. ~/.config/fish/custom/functions.fish

. ~/.config/fish/custom/prompt.fish

#verify username and show time when logging on
set fish_greeting (whoami):(date +"%r")

# Set Base16 Shell colors
eval sh ~/.config/fish/base16-eighties.dark.sh
if test -f /Users/ben/.autojump/etc/profile.d/autojump.fish; . /Users/ben/.autojump/etc/profile.d/autojump.fish; end



