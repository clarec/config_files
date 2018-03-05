#!/bin/bash

# Default to human readable figures
alias df='df -kTh'
#alias du='du -ach | sort -h'
alias du='du -kh --max-depth=1'

# Misc :)
# alias less='less -r'                          # raw control characters
# alias whence='type -a'                        # where, of a sort
alias grep='grep --color=auto'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour

# Some shortcuts for different directory listings
alias ls='ls -hF --color=auto'                # classify files in colour
alias l.='ls -d .* --color=auto'              # show hidden files
#eval `dircolors /home/USER/.dircolors`
alias dir='ls --color=auto --format=vertical --group-directories-first'
alias vdir='ls --color=auto --format=long --group-directories-first'
alias ll='ls -lhvA --group-directories-first'   # long list
alias la='ls -A'                              # all but . and ..
alias lrt='ls -Alrt'
alias l='ls -CF'                              #
alias lcol='ls | pr -T9 -W$COLUMNS'           # print ls in 9 columns to width of terminal


alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'
# pretty print of some PATH variables
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'

#alias vi='vim'

#alias dalmalogin=`ssh ce38@dalma.abudhabi.nyu.edu`

alias mc='. /usr/share/mc/bin/mc-wrapper.sh'

alias ssh_dal='ssh -X ce38@dalma.abudhabi.nyu.edu'
# alias rungotm='./home/clare/local/gotm/bin/gotm'
