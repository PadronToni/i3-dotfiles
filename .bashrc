#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PS1="\[\e[33;40m\] \w\[\e[m\]\[\e[40m\] \[\e[m\]\[\e[34;40m\]> \[\e[m\] "

if [ -e ~/.bashrc.aliases ] ; then
   source ~/.bashrc.aliases
fi
# >>> Added by cnchi installer
EDITOR=/usr/bin/nvim

export PATH=$PATH:$HOME/.scripts/
