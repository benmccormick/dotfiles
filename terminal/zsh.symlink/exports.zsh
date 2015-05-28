# setup PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH
# set terminal to 256 colors
[ -z "$TMUX" ] && export TERM=xterm-256color
# Setup autojump
[[ -s `brew --prefix`/etc/autojump.zsh ]] && . `brew --prefix`/etc/autojump.zsh
# Base16 Shell
BASE16_SCHEME="eighties"
BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL
