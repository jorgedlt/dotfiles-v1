# .bashrc -- for AWS and other Cloud Nodes
#
#

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
# shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# My Email ENV
  export MyEmail='jorgedlt@gmail.com'

# EDITOR
export VISUAL='vim'

# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

 alias now=' date +"%Y-%m-%d:%T"'

 export HISTTIMEFORMAT='%F %T  '  # place Time Stamp info into history out
        # History TimeStamp - http://www.tecmint.com/history-command-examples/

# Set vim as default
 alias vi=vim

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
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

# Window Dimensions
	alias windim="echo $(tput cols)x$(tput lines)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

	alias ls='ls --color=auto'

	# I'm not sure, but I think the LSCOLORS and .dircolors conflict with each other
	LS_COLORS='di=35:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=34'
	export LS_COLORS

 	alias dir='dir --color=auto'
 	alias vdir='vdir --color=auto'

 # some more ls aliases
 	alias ll='ls -AhHl --color=auto'
 	alias la='ls -A'
 	alias l='ls -CF'

# tell grep to highlight matches
 	export GREP_COLOR='1;31'        # GREP_COLOR is deprecated
 	export GREP_COLORS='1;31'
 	export GREP_OPTIONS='--color=auto'

  alias  grep='grep  --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
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

#
 alias ll="ls -l"
 alias lc="ls -C"
 alias lb="ls -C $HOME/mybin"
 alias l.="ls -lart"
 alias cls="clear"

# Create a new set of commands
 alias path='echo -e ${PATH//:/\\n}'
 alias now=' date +" %T"'
 alias nowtime=now
 alias nowdate='date +" %Y-%m-%d"'
 alias list=history

# Set vim as default
 alias vi=vim

# Stop after sending count ECHO_REQUEST packets #
 alias ping='ping -c 3'

# confirmation #
 alias mv='mv -i'
 alias cp='cp -i'
 alias ln='ln -i'

# tping 10.188.55.83
# Wed Feb 26 08:42:37 EST 2014: PING 10.188.55.83 (10.188.55.83) 56(84) bytes of data.
# Wed Feb 26 08:42:37 EST 2014: 64 bytes from 10.188.55.83: icmp_req=1 ttl=123 time=0.867 ms
# Wed Feb 26 08:42:38 EST 2014: 64 bytes from 10.188.55.83: icmp_req=2 ttl=123 time=0.630 ms

# tping  (timed_ping)
  function tping { ping $1 | while read pong; do echo "$(date): $pong"; done; }
  export -f tping

# tcpping
  function tcpping { sudo /usr/sbin/hping3 $1 -c 3 -S -V -A -p 22 | while read hong; do echo "$(date): $hong"; done; }
  export -f tcpping

# list CMD history
function list {
  history
}

# list CMD history with grep match
function glist {
  history | grep $1
}

# list PS list with grep match
function gps {
  ps -ef | grep $1
}

# terminal tab name
function tabname {
  printf "\e]1;$1\a"
}

# terminal windows name
function winname {
  printf "\e]2;$1\a"
}
