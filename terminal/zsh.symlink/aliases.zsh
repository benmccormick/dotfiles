#Aliases

### General Tool Aliases
# Force tmux to use 256 colors
alias tmux="tmux -2"
alias eclipse="/ws/bemccorm-rtp/eclipse/eclipse &"
alias subl="/ws/bemccorm-rtp/sublime_text_3/sublime_text"

### PPM Aliases

alias nb="/auto/mwtm/ppm/tools/updateANAPM10.sh"
alias rf="/ws/bemccorm-rtp/scripts/rffull.sh"
alias refweb="/ws/bemccorm-rtp/scripts/refweb.sh"
alias rfjs="/ws/bemccorm-rtp/scripts/rfjs.sh"
alias console="vim /opt/CSCOppm-gw/logs/sgmConsoleLog.txt"
alias crp="/vob/sgm/bin/crprep"
alias build="/vob/sgm/bin/build.sh"

## Clearcase specific aliases
alias ct="cleartool"
alias unco="ct unco -rm"
alias ci="/ws/bemccorm-rtp/scripts/ci.sh"
alias co="ct co -unr -nc"
alias lscof='ct lsco -cview -all |  sed '\''s/.*\/vob/\/vob/g'\'' | sed '\''s/".*//g'\'' | grep '\''/vob/'\'' | grep -v '\''/VersionViewer.java'\'' '
alias reinstall="/auto/mwtm/ppm/tools/ppm-update-latest.sh -u -s"
alias lcis="history|grep 'ci CSC'"
alias dp="ct diff -predecessor "


# VNC Related Commands
alias vn1080="xrandr -s 1920x1080"
alias vn1200="xrandr -s 1600x1200"
alias vn900="xrandr -s 1600x900"


