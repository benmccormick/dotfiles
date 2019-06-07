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

# Caleb related aliases
alias claeb "open -a /Applications/Dictionary.app/"

# Git related aliases
alias push "git push --set-upstream origin (git branch ^/dev/null | grep \* | sed 's/* //')"
alias pull "git pull"
function g --wraps git
        git $argv;
end

# Windsor Circle
#

alias ddb  "docker exec -it wcproc_dev_latest_dev bash -c 'psql --user wcdbadmin -h wcdb0_test_latest_dev wcdb'"

# Whatcounts

# copy front end
alias cfe "ant -f /Users/ben/Code/Windsor/whatcounts/workspace/trunk/build/dev_build.xml _allFrontEnd"


set -gx EDITOR nvim
set -gx ANALYTICS_KEY '/Users/ben/.config/analytics-api-d8a6e7a79f5c.json'


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


set -gx WCREGISTRY "registry.windsorcircle.com/docker"
set DOCKER_TLS_HOSTNAME "localhost"
set -gx PLAYBOOKS "/Users/ben/Code/Windsor/wcui_docker/playbooks"


set -gx ap_docker "run -it --rm --env-file "$HOME"/Code/Windsor/wcui_docker/env.list -v "$HOME"/Code/Windsor:/root/Code/Windsor -v "$HOME"/Code/Windsor/wcui_docker:/root/Repos/wcui_docker -v "$HOME"/.ssh:/root/.ssh -v /var/run/docker.sock:/var/run/docker.sock -v "$HOME"/.dind:/root/.docker registry.windsorcircle.com/docker/wc_deploy/ansible"

set -gx ap "ansible-playbook wcui_docker/playbooks"

function wcrun
    echo "$ap_docker wcrun \"$argv\" home_dir="$HOME;
    eval docker $ap_docker wcrun \"$argv\" home_dir=$HOME;
end

function fish_mode_prompt
    # noop
end

function gitrev
    eval docker $ap_docker gitrev $argv
end

function glidersvn
    svn add --force site/html/glider
    svn st | grep ! | cut -d! -f2| sed 's/^ *//' | sed 's/^/"/g' | sed 's/$/"/g' | rg site/html/glider | xargs svn rm
end

# function __wcbuild { $(echo "$ap_docker" "$ap"/"$1"/build.yml -e "home_dir=$HOME" "${@:2}"); }

# function __gitrev { $(echo "$ap_docker" wcui_docker/playbooks/gitrev/gitrev "$@"); }

# alias wcrun='__wcrun'
# alias wcbuild='__wcbuild'
# alias gitrev='__gitrev'
