function uiworkspace -d "create a new tmux session as a ui workspace, or attach to it if it exists"
  set BASE ~/Code/Windsor/wcui_dev/src/wcui/
  cd $BASE 
  tmux start-server
  if not tmux has-session -t uiworkspace
    tmux new-session -d -s uiworkspace -n dev
    tmux new-window  -t uiworkspace:2 -n console 
    tmux new-window  -t uiworkspace:3 -n git 
    tmux send-keys -t uiworkspace:2 'cd ../../' C-m
    tmux split-window -v -t uiworkspace:2
    tmux send-keys -t uiworkspace:2.0 'bin/pserve etc/wcui.ini' C-m
    tmux split-window -v -p 15 -t uiworkspace:1 
    tmux split-window -h -t uiworkspace:1.1 
    tmux send-keys -t uiworkspace:1.0 'vim -O build.js' C-m 
  end
  tmux attach -t uiworkspace
end
