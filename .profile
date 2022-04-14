# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

PATH="$HOME/.local/bin:$PATH"
setxkbmap -option ctrl:nocaps
echo -e "\033]710;xft:Envy Code R:Regular:size=25\033\\"
xrdb ~/.Xdefaults

export PATH=$PATH:$HOME/usr/bin
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$(go env GOPATH)/bin
export RESTIC_REPOSITORY="rest:http://localhost:8081"
export RESTIC_PASSWORD="cupmonkeybellmail0"
export EDITOR=nvim
. "$HOME/.cargo/env"

# Prevent screen from turning off after timeout
xset s off
xset -dpms
xset s noblank

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
