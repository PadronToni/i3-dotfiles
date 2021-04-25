#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


if [ -e ~/.bashrc.aliases ] ; then
   source ~/.bashrc.aliases
fi
# >>> Added by cnchi installer
EDITOR=/usr/bin/nvim
# export TERM=urxvtc

# Loading the python powerline
# powerline-daemon -q
# POWERLINE_BASH_CONTINUATION=1
# POWERLINE_BASH_SELECT=1
# . /usr/share/powerline/bindings/bash/powerline.sh

# =====================
# Colors
# =====================

COLOR_RED="\033[40;31m"
COLOR_YELLOW="\033[40;33m"
COLOR_GREEN="\033[40;32m"
COLOR_OCHRE="\033[38;5;95m"
COLOR_BLUE="\033[40;34m"
COLOR_WHITE="\033[40;37m"
COLOR_RESET="\033[0;0m"


# =====================
# Functions
# =====================

function ispoweroftwo {

    if [ $1 != 0  ] && [ $1 > 2 ]; then
        sas=$(expr $1 + 1)
        echo $sas
    fi
}

function git_color {
  local git_status="$(git status 2> /dev/null)"

  if [[ ! $git_status =~ "working directory clean" ]]; then
    echo -e "\[$COLOR_RESET\] \[$COLOR_RED\]"
  elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e "\[$COLOR_RESET\] \[$COLOR_YELLOW\]"
  elif [[ $git_status =~ "nothing to commit" ]]; then
    echo -e "\[$COLOR_RESET\] \[$COLOR_GREEN\]"
  else
    echo -e "\[$COLOR_RESET\] \[$COLOR_OCHRE\]"
  fi
}

function git_branch {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo -e $(git_color)" $branch "
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo -e $(git_color)" $commit "
  fi
}


# =====================
# PS1
# =====================
# PS1="\[$COLOR_YELLOW\] \w "          # basename of pwd
# PS1+="$(git_color)"        # colors git status
# PS1+="$(git_branch)"           # prints current branch
# PS1+="\[\033[0;34m\] >\[$COLOR_RESET\] "   # '#' for root, else '>'
# export PS1
export PS1="\[\e[33;40m\] \w\[\e[m\]\[\e[40m\] \[\e[m\]\[\e[34;40m\]> \[\e[m\] "


export PATH=$PATH:$HOME/.scripts/
