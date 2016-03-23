eval (python -m virtualfish)
set -x ORACLE_HOME ~/oracle/instantclient_11_2
set -x LD_LIBRARY_PATH :/home/roderick/oracle/instantclient_11_2
# Base16 Shell
eval sh /home/roderick/.config/base16-shell/base16-default.dark.sh

#function to load env variables
function setenv; set -gx $argv; end 
source ~/.passwd

