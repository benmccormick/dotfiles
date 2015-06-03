ackf(){
    ack -l $@ |fpp
}

gsf() {
    git status | fpp
}

gmf() {
    git diff --name-status --diff-filter=U |fpp
}

findf() {
    ack -g $@ |fpp
}

pjf() {
    if [ ! -z $1 ] 
    then 
    pj -f $1 |fpp
    else
    pj |fpp
    fi
}
