# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend
shopt -s cmdhist

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
#display timestamp along with command
export HISTTIMEFORMAT='%F %T '
# don't put duplicate lines in the history
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
export HISTIGNORE=$'[ /t]*:&:[fb]g:exit:ls:la:ll'

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# when changing directory small typos can be ignored by bash
shopt -s cdspell

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1="\n[\[\033[32m\]\w]\[\033[0m\]\n\[\033[1;34m\]\u\[\033[1;30m\]$ \[\033[0m\]"

else
    #PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    PS1="\n[\[\033[32m\]\w]\[\033[0m\]\n\[\033[1;30m\]\u\[\033[1;30m\]$ \[\033[0m\]"

fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    #alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases (see bash_aliases!)
#alias ll='ls -alF'
#alias la='ls -A'
#alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export VISUAL=vim
export EDITOR="$VISUAL"
# force less to allow control sequences that change the color of output
export LESS=-R

# added by Anaconda2 4.1.1 installer
export PATH="/home/clare/anaconda2/bin:$PATH"
export PATH=/usr/local/bin:$PATH
export LD_LIBRARY_PATH="/usr/local/lib:/usr/local/netcdf432/lib:$LD_LIBRARY_PATH"
# alias anacondainit='export PATH="/home/clare/anaconda2/bin:$PATH"'

# ncl libraries
export NCARG_ROOT="/usr/"
#export PATH="/home/clare/Build_WRF/LIBRARIES/netcdf/bin:$PATH"
#export LD_LIBRARY_PATH="/home/clare/Build_WRF/LIBRARIES/netcdf/lib:$LD_LIBRARY_PATH"
#export NETCDF="/home/clare/Build_WRF/LIBRARIES/netcdf"
#export NETCDF_INCDIR="/home/clare/Build_WRF/LIBRARIES/netcdf/include"
#export NETCDF_LIBDIR="/home/clare/Build_WRF/LIBRARIES/netcdf/lib"

#export ESMF_DIR=/home/clare/esmf
#export ESMF_INSTALL_PREFIX=/usr/local/esmf
#export ESMF_OS=Linux
#export ESMF_NETCDF=/home/clare/Build_WRF/LIBRARIES/netcdf
#"local"
#export ESMF_COMM=mpiuni
#export ESMF_F90COMPILER=gfortran
#export ESMF_CXXCOMPILER=g++
#export ESMF_TESTEXHAUSTIVE=on
#export ESMF_TESTSHAREDOBJ=on
#export ESMF_NETCDF_INCLUDE=/home/clare/Build_WRF/LIBRARIES/netcdf/include
#/usr/local/netcdf4/include
#export ESMF_NETCDF_LIBS="-lnetcdf -lnetcdff"
#export ESMF_NETCDF_LIBPATH=/home/clare/Build_WRF/LIBRARIES/netcdf/lib
#/usr/local/netcdf4/lib
#export ESMF_BOPT=O3

export matlabroot="/home/clare/MATLAB/R2017a/bin/matlab"
export PATH="/home/clare/MATLAB/R2017a/bin/:$PATH"

source /usr/local/ferret/ferret_paths

# to fix issue with matplotlib error msg:
export GIO_EXTRA_MODULES=/usr/lib/x86_64-linux-gnu/gio/modules/

# this fixes the problem of synaptic not opening:
if ! xhost |grep -q SI:localuser:root;then  
      xhost si:localuser:root >/dev/null
fi

#export ssh_dal='ssh -X ce38@dalma.abudhabi.nyu.edu'
export GOTMDIR=/home/clare/local/gotm/bin/
