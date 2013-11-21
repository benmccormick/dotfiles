# correct spelling for all arguments etc
setopt correctall
#when you enter a plain directory name, treat it as a cd
setopt autocd
#treat single word commands without redirection as a command to resume previous session
setopt auto_resume
#Treats #, ~, and ^ as patterns for filename generation
setopt extendedglob

#the cursor stays at the start of the word and completion is done from both ends
setopt completeinword

#ignore dups in history
setopt histignorealldups sharehistory


