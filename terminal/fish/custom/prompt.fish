
## Define Prompt Below (Agnoster Prompt based on https://gist.github.com/hauleth/5661084)

set SEGMENT_SEPARATOR '⮀'
set SEGMENT_BG
set RSTATUS
 
# Create segment of prompt
function prompt_segment
  set -l bg $argv[1]
  set -l fg $argv[2]
  [ (count $argv) -gt 2 ]; and set -l content $argv[3..-1]
 
  set_color -b $bg
 
  if begin; [ -n "$SEGMENT_BG" ]; and [ "$SEGMENT_BG" != "$bg" ]; end
    color_echo $SEGMENT_BG $SEGMENT_SEPARATOR
  end
 
  if [ -n "$content" ]
    set SEGMENT_BG $bg
    set_color -b $bg $fg
    echo -n " $content"
  end
  set_color normal
end
 
function color_echo
  set_color $argv[1]
  echo -n $argv[2]
  #set_color normal
end
 
function prompt_context
  #prompt_segment black normal
  set -l user (whoami)
  set -l host (hostname)
 
  if begin; [ "$user" != "$DEFAULT_USER" ]; or [ -n "$SSH_CLIENT" ]; end
    #prompt_segment black normal "$user@$host "
  end
end
 
# Status:
# - was there an error
# - am I root
# - are there background jobs?
function prompt_status
  set -l icons
  if [ $RSTATUS != 0 ]
    set icons $icons (set_color red -b black; echo "✘ ")
  end
  if [ (id -u $USER) = 0 ]
    set icons $icons (set_color red -b black; echo "⚡ ")
  end
  if [ (jobs -l | wc -l |tr -d " ") != "0" ]
    set icons $icons (set_color red -b black; echo "⚙ ")
  end
 
  prompt_segment black normal "$icons"
end
 
function prompt_git
  if command git rev-parse --is-inside-work-tree >/dev/null 2>&1
    set -l ref
    if command git symbolic-ref HEAD > /dev/null 2> /dev/null
      set ref (command git branch ^&- | awk ' {print $2}')
      set ref "⭠ $ref"
    else
      set ref (command git show-ref --head -s --abbrev |head -n1 2> /dev/null)
      set ref "➦ $ref"
    end
    set -l dirty (command git status -s 2> /dev/null)
    if [ -n "$dirty" ]
      prompt_segment yellow black "$ref± "
    else
      prompt_segment green black "$ref "
    end
  end
end
 
# Dir: current working directory
function prompt_dir
  set -l dir (prompt_pwd)
  prompt_segment blue black "$dir "
end
 
function prompt_finish
  prompt_segment normal normal
  echo -n ' '
  set SEGMENT_BG
end
 
function fish_prompt
  set RSTATUS $status
  prompt_status
  prompt_context
  prompt_dir
  prompt_git
  prompt_finish
end
