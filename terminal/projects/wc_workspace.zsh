export BASE=~/Code/Windsor/wcui_dev/src/wcui/
cd $BASE
tmux start-server
if ! (tmux has-session -t wcw >/dev/null 2>&1); then
    tmux new-session -d -s wcw -n dev
    tmux new-window  -t wcw:2 -n console 
    tmux new-window  -t wcw:3 -n git 
    tmux send-keys -t wcw:2 'cd ../../' C-m
    tmux split-window -v -t wcw:2
    tmux send-keys -t wcw:2.0 'rs' C-m
    tmux split-window -v -p 15 -t wcw:1 
    tmux split-window -h -t wcw:1.1 
    tmux send-keys -t wcw:1.0 'vim -O build.js' C-m 
fi
tmux attach -t wcw
