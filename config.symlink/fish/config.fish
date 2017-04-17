alias vim "nvim"
alias push "git push --set-upstream origin (git branch ^/dev/null | grep \* | sed 's/* //')"
alias swchrome '/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --unsafely-treat-insecure-origin-as-secure="http://local.windsorcircle.com:6543" --user-data-dir=/tmp/chromedir'
alias n "nvim"

set -gx EDITOR nvim
set -gx ANALYTICS_KEY '/Users/ben/.config/analytics-api-d8a6e7a79f5c.json'

set WCREGISTRY "registry.windsorcircle.com"
set DOCKER_TLS_HOSTNAME "localhost"

if test -d ~/Code/Windsor/scripts
    set -gx PATH $PATH ~/Code/Windsor/scripts
end

set -g theme_nerd_fonts yes
# set -g theme_color_scheme solarized-light
#set -g theme_color_scheme zenburn

function fish_user_key_bindings
  fish_vi_key_bindings
  set -g theme_display_vi yes
end
function fish_mode_prompt
end function
