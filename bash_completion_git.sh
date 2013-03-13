# git settings
# via. http://blog.ruedap.com/entry/20110706/mac_terminal_git_branch_name
#
# <usage>
# add this to .bashrc or .bash_profile
#    source ~/dotfiles/bash_completion_git.sh

source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash
__git_complete g __git_main
GIT_PS1_SHOWDIRTYSTATE=true
#export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[33m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '

