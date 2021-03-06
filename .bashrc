#!/usr/bin/env bash

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

# Path to the bash it configuration
export BASH_IT="/home/gergo/.bash-it"

# Lock and Load a custom theme file.
# Leave empty to disable theming.
# location /.bash_it/themes/
#export BASH_IT_THEME='powerline' 
export BASH_IT_THEME=''  # disable for powerline

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
#export SHORT_USER=${USER:0:8}

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
#export SHORT_TERM_LINE=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Uncomment this to make Bash-it create alias reload.
# export BASH_IT_RELOAD_LEGACY=1

# Load Bash It
source "$BASH_IT"/bash_it.sh

# Powerline
. /usr/share/powerline/bindings/bash/powerline.sh

[ -f ~/.forgit/forgit.plugin.sh ] && source ~/.forgit/forgit.plugin.sh
export QT_QPA_PLATFORMTHEME=qt5ct


[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Check if we run under WSL
uname -r | grep microsoft >/dev/null
WSL=$?

if [ $WSL -eq 0 ]; then
    export WSL=1
    # we are running under WSL so we can do WSL specific things here
    export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf):0
    export LIBGL_ALWAYS_INDIRECT=1
    export DK_SCALE=1
else
    export WSL=0
    # we are running under a standalone Linux -- currently only spaceholder for non WSL specific things in the future
fi

# Attach or start tmux
if [[ $TERM == xterm-256color ]]; then # attach or start only in xterm256 terminals (wsl) but not in xterm or other terms
tmux attach &> /dev/null

    if [[ ! $TERM =~ screen ]]; then # if attach failed and we are not running under tmux, start one
        exec tmux
    fi

fi

