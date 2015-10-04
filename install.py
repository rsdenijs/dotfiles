from subprocess import call
import os
nvim =  "ln -s".split()+  os.path.abspath("vim/.vimrc").split() + [os.path.join(os.path.expanduser('~'),'.nvimrc')]
call(nvim)
vim =  "ln -s".split()+  os.path.abspath("vim/.vimrc").split() + [os.path.join(os.path.expanduser('~'),'.vimrc')]
call(vim)



