from subprocess import call
import os
goal = os.path.join(os.path.expanduser('~'),'.config/nvim')
try:
	os.makedirs(goal)
except Exception as e:
	print e
	pass
nvim =  "ln -s".split()+  os.path.abspath("vim/.vimrc").split() + [os.path.join(goal,'init.vim')]
call(nvim)

vim =  "ln -s".split()+  os.path.abspath("vim/.vimrc").split() + [os.path.join(os.path.expanduser('~'),'.vimrc')]
call(vim)

tmux = "ln -s".split() + os.path.abspath("tmux/tmux.conf").split() + [os.path.join(os.path.expanduser('~'),'.tmux.conf')]
call(tmux)

bashrc = "ln -s".split() + os.path.abspath("bashrc/bashrc.conf").split() + [os.path.join(os.path.expanduser('~'),'.bashrc.conf')]
call(bashrc)



