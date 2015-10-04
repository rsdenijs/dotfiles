from subprocess import call
import os
out =  "ln -s vim/.vimrc ".split() + [os.path.join(os.path.expanduser('~'),'.nvimrc')]
call(out)



