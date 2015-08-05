# setup PATH
export PATH=$HOME/bin:/usr/local/bin:$HOME/Code/Windsor/wcui_dev/bin:$HOME/Code/Windsor/scripts/:/Library/PostgreSQL/9.3/bin:/usr/local/go/bin:$PATH
export PYTHONPATH=~/Code/experiments/personally_api/models:$PYTHONPATH:/Library/Python/2.7/site-packages
export EDITOR='subl'

# set terminal to 256 colors
[ -z "$TMUX" ] && export TERM=xterm-256color

# Setup autojump
#[[ -s `brew --prefix`/etc/autojump.zsh ]] && . `brew --prefix`/etc/autojump.zsh

# Base16 Shell
BASE16_SCHEME="mocha"
BASE16_COLOR="dark"
BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.$BASE16_COLOR.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL
