# RZ: -- Don't continue if non-interactive shell
[ -z "$PS1" ] && return


stty stop ''

HISTCONTROL=ignoredups:ignorespace
shopt -s histappend
shopt -s checkwinsize
HISTSIZE=1000
HISTFILESIZE=2000

#export HISTTIMEFORMAT="%h/%d - %H:%M:%S "
#export PS1="{\[$(tput sgr0)\]\[\033[38;5;208m\]\$?\[$(tput sgr0)\]\[\033[38;5;15m\]} \[$(tput sgr0)\]\[\033[38;5;7m\]\d\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;229m\]\t\[$(tput sgr0)\]\[\033[38;5;15m\]\n\[$(tput sgr0)\]\[\033[38;5;118m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;120m\]\h\[$(tput sgr0)\]\[\033[38;5;6m\][\[$(tput sgr0)\]\[\033[38;5;15m\]\w\[$(tput sgr0)\]\[\033[38;5;6m\]]\[$(tput sgr0)\]\[\033[38;5;15m\]\\$ \[$(tput sgr0)\]"

#export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33m\]\w\[\033[m\]\$ "
#export CLICOLOR=1
#export LSCOLORS=ExFxBxDxCxegedabagacad

export TERM=xterm-256color
export LANG=en_US.utf8

REPO_DIR=${HOME}/Repositories/dotfiles

if [ -f ${REPO_DIR}/bash_aliases ]; then
  source ${REPO_DIR}/bash_aliases
fi

# RZ: -- Vim is my default editor
export EDITOR=emacs


function beep()
{
  echo -ne '\007'
  sleep 0.25
  echo -ne '\007'
  sleep 0.25
  echo -ne '\007'
}

function swap()
{
  if [ $# -lt 2 ]
  then
    echo "Usage: swap <file1> <file2>"
    return
  fi
  local TMPFILE=tmp.$$
  mv "$1" $TMPFILE
  mv "$2" "$1"
  mv $TMPFILE "$2"
}

function settitle() {
  if [ $# -eq 0 ]
  then
    echo "Usage: settitle <title>"
    return
  fi
  echo "Setting title to $1"
  echo -ne "\033]0;$1\007"
}

function xtmp () {
  tar xvf $1 -C /tmp
}

function loop () {
  local CMD=$*
  local i=0
  if [ "$CMD" == "" ]
  then
    echo "You have to give a valid command to execute"
    return 1
  fi

  while true
  do
    i=$(($i+1))
    echo ""
    echo ""
    echo "=========================="
    echo "     ITERATION $i         "
    echo "=========================="
    $CMD 2>&1 | tee loop.out
    grep "FAILED" loop.out
    if [ $? -eq 0 ]
    then
      echo "##########################"
      echo "     FOUND FAILURE        "
      echo "##########################"
      break;
    fi
  done
}
