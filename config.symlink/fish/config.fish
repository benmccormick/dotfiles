# Vim Related Aliases
alias vim "nvim"
alias n "nvim"

# Jest Related aliases
alias j "npm test"
alias jw "npm test -- --watch"
alias jo "npm test -- -o"
alias ju "npm test -- -u"
alias jou "npm test -- -ou"
alias jc "npm test -- --coverage"

# Git related aliases
alias push "git push --set-upstream origin (git branch ^/dev/null | grep \* | sed 's/* //')"
alias pull "git pull"
function g --wraps git
        git $argv;
end


set -g theme_nerd_fonts yes

function fish_user_key_bindings
  fish_vi_key_bindings
  set -g theme_display_vi yes
end


function fish_mode_prompt
    # noop
end
