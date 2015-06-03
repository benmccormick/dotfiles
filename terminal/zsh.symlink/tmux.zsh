# WC UI workspace
uiworkspace() {
    export BASE=~/Code/Windsor/wcui_dev/src/wcui/

    cd $BASE 
    tmux start-server
    tmux has-session -t uiworkspace > /dev/null
    if [ $? -eq 1 ]; then
    tmux new-session -d -s uiworkspace -n wcui

    tmux split-window -v -p 15 -t uiworkspace:1 
    tmux split-window -h -t uiworkspace:1.1 
    tmux send-keys -t uiworkspace:1.2 'gulp dev' C-m

    tmux new-window  -t uiworkspace:2 -n wcui_dev 

    tmux send-keys -t uiworkspace:2 'cd ../../' C-m
    tmux send-keys -t uiworkspace:2.0 'bin/pserve etc/wcui.ini' C-m
    tmux split-window -v -t uiworkspace:2

    tmux new-window  -t uiworkspace:3 -n wclib 


    tmux send-keys -t uiworkspace:3 'cd ../wclib/' C-m

    tmux new-window  -t uiworkspace:4 -n wcdb_model 

    tmux send-keys -t uiworkspace:4 'cd ../wcdb_model/' C-m

    tmux new-window  -t uiworkspace:5 -n wcui_reports

    tmux send-keys -t uiworkspace:5 'cd ../wcui_reports/' C-m

    tmux send-keys -t uiworkspace:1.0 'vim -O .' C-m 
    selectw -t 1
    selectp -t 0
    fi
    tmux attach -t uiworkspace
}

blogworkspace() {
    export BASE=~/Dropbox/blog_drafts/
    cd $BASE 
    tmux start-server
    tmux has-session -t blogworkspace > /dev/null
    if [ $? -eq 1 ]; then
    tmux new-session -d -s blogworkspace -n drafts
    tmux new-window  -t blogworkspace:2 -n blogdir
    tmux send-keys -t blogworkspace:2 'cd ~/Blog ' C-m
    tmux split-window -v -p 15 -t blogworkspace:1 
    tmux send-keys -t blogworkspace:1.0 'vim -O .' C-m 
    fi
    tmux attach -t blogworkspace
}

scratchworkspace() {
    export BASE=~/dotfiles
    cd $BASE 
    tmux start-server
    tmux has-session -t scratchworkspace > /dev/null
    if [ $? -eq 1 ]; then
        tmux new-session -d -s scratchworkspace -n dotfiles
    fi
    tmux attach -t scratchworkspace
}

pjworkspace() {
    export BASE=~/Code/projects/pj
    cd $BASE 
    tmux start-server
    tmux has-session -t pjworkspace > /dev/null
    if [ $? -eq 1 ]; then
        tmux new-session -d -s pjworkspace -n pj
        tmux new-window  -t pjworkspace:2 -n testarea
        tmux send-keys -t pjworkspace:2 'cd ~/Code/Windsor/wcui_dev/src/wcui ' C-m
    fi
    tmux attach -t pjworkspace
}
