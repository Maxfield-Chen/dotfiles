# /etc/bash.bashrc
#
# https://wiki.archlinux.org/index.php/Color_Bash_Prompt
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output. So make sure this doesn't display
# anything or bad things will happen !

# Test for an interactive shell. There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.

# If not running interactively, don't do anything!
[[ $- != *i* ]] && return

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

# Enable history appending instead of overwriting.
shopt -s histappend
case ${TERM} in
        xterm-termite|xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
                PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
                ;;
        screen)
                PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
                ;;
esac

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS. Try to use the external file
# first to take advantage of user additions. Use internal bash
# globbing instead of external grep binary.

# sanitize TERM:
safe_term=${TERM//[^[:alnum:]]/?}
match_lhs=""

[[ -f ~/.dir_colors ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs} ]] \
        && type -P dircolors >/dev/null \
        && match_lhs=$(dircolors --print-database)

if [[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] ; then

        # we have colors :-)

        # Enable colors for ls, etc. Prefer ~/.dir_colors
        if type -P dircolors >/dev/null ; then
                if [[ -f ~/.dir_colors ]] ; then
                        eval $(dircolors -b ~/.dir_colors)
                elif [[ -f /etc/DIR_COLORS ]] ; then
                        eval $(dircolors -b /etc/DIR_COLORS)
                fi
        fi
        PS1="$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;32m\]\u'; fi)\[\033[00;37m\] in\[\033[01;34m\] \W \$([[ \$? != 0 ]] && echo \"\[\033[01;31m\]✗\[\033[01;34m\] \")\[\033[01;37m\]"


        alias ls="ls --color=auto"
        alias dir="dir --color=auto"
        alias grep="grep --color=auto"
        alias dmesg='dmesg --color'
        alias rm="rm -iv"


else

        # show root@ when we do not have colors

        PS1="$(if [[ ${EUID} == 0 ]]; then echo '\[\033[00;31m\]\h'; else echo '\[\033[00;32m\]\u'; fi)\[\033[00;37m\] in\[\033[00;34m\] \W \$([[ \$? != 0 ]] && echo \"\[\033[01;31m\]✗\[\033[01;34m\] \")\[\033[00;37m\]"
        #PS1="\u@\h \w \$([[ \$? != 0 ]] && echo \":( \")\$ "

        # Use this other PS1 string if you want \W for root and \w for all other users:
        # PS1="\u@\h $(if [[ ${EUID} == 0 ]]; then echo '\W'; else echo '\w'; fi) \$([[ \$? != 0 ]] && echo \":( \")\$ "

fi

PS2="> "
PS3="> "
PS4="+ "

# Try to keep environment pollution down, EPA loves us.
unset safe_term match_lhs

# Try to enable the auto-completion (type: "pacman -S bash-completion" to install it).
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Try to enable the "Command not found" hook ("pacman -S pkgfile" to install it).
# See also: https://wiki.archlinux.org/index.php/Bash#The_.22command_not_found.22_hook
[ -r /usr/share/doc/pkgfile/command-not-found.bash ] && . /usr/share/doc/pkgfile/command-not-found.bash


setxkbmap -option ctrl:nocaps
setxkbmap -option ctrl:lctrl_lalt
alias cc='setxkbmap -option ctrl:nocaps'
alias sivpn='lpass show jumpcloud.com -c --password; sudo openvpn --config ~/openvpn_config/client.ovpn'
alias t0='tmux -2 new-session -t 0'
alias armvm='sudo qemu-system-arm -kernel ~/projects/arm-exploits/rpi_vm/qemu-rpi-kernel/kernel-qemu-4.4.34-jessie -cpu arm1176 -m 256 -M versatilepb -serial stdio -append "root=/dev/sda2 rootfstype=ext4 rw" -hda ~/projects/arm-exploits/rpi_vm/2017-04-10-raspbian-jessie/raspbian.img -net nic -net tap,ifname=tap0,script=no,downscript=no -no-reboot'
alias armvm_o='sudo qemu-system-arm -kernel ~/projects/arm-exploits/rpi_vm/qemu-rpi-kernel/kernel-qemu-4.4.34-jessie -cpu arm1176 -m 256 -M versatilepb -serial stdio -append "root=/dev/sda2 rootfstype=ext4 rw" -hda ~/projects/arm-exploits/rpi_vm/2017-04-10-raspbian-jessie/raspbian.img -netdev tap,id=mynet0,ifname=tap0,script=no,downscript=no -device e1000,netdev=mynet0,mac=52:55:00:d1:55:01 -no-reboot'
xrdb ~/.Xdefaults
alias logping='screen sudo tcpdump -i eth0 icmp and icmp[icmptype]=icmp-echo'
alias ls='ls --color=auto'
alias vpndns='sudo cp /etc/resolv-vpn.conf /etc/resolv.conf && sudo systemctl restart network-manager'
alias nodns='sudo cp /etc/no-vpn-resolv.conf /etc/resolv.conf && sudo systemctl restart network-manager'
set LEIN_USE_BOOTCLASSPATH=no

sr () {
  input="'$*'"
  nohup "$input" &
}

alias btr='sudo /etc/init.d/bluetooth restart'
alias bts='sudo /etc/init.d/bluetooth start'
alias btk='sudo /etc/init.d/bluetooth stop'
alias websync='rsync -av /home/nihliphobe/projects/haskell/maxfieldchen-com/_site/ nginx@maxfieldchen.com:/var/www/maxfieldchen.com/ --delete'
alias webbuild='cd /home/nihliphobe/projects/haskell/maxfieldchen-com && nix-shell --run "cabal run site build"'
alias plover='source /home/nihliphobe/tools/plover/plover/bin/activate && /home/nihliphobe/tools/plover/launch.sh > /dev/null 2>&1 &'
alias monitor_setup='xrandr --auto --output DP-0 --right-of DP-1 --output eDP-1-1 --off'
export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libgtk3-nocsd.so.0
alias chalssh='ssh -i ~/.ssh/SecurityInnovation_User5.pem -oServerAliveInterval=10 ubuntu@52.70.104.199'
alias homeon='xrandr --output DP-3.1 --auto; xrandr --output eDP-1-1 --off; xrandr --output DP-3.2 --auto; xrandr --output DP-3.3 --auto; xrandr --output DP-3.3 --left-of DP-3.2; xrandr --output DP-3.1 --right-of DP-3.2; xrandr --output DP-3.1 --rotate left;'
alias workon='xrandr --output eDP-1-1 --off --output DP-3.1 --auto'
alias lapon='xrandr --output eDP-1-1 --auto --output DP-3.1 --off && xrandr -s 0'
# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

export PATH="/home/nihliphobe/.pyenv/bin:$PATH"
export PATH="/home/nihliphobe/.stack/programs/x86_64-linux/ghc-8.10.7/bin/:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
alias blueconnect="echo 'connect 94:DB:56:18:CA:D5' | bluetoothctl"
alias bluedisconnect="echo 'disconnect 94:DB:56:18:CA:D5' | bluetoothctl"
alias hack-the-box="sudo openvpn /home/nihliphobe/projects/hack-the-box/configure/lab_drydryserial.ovpn"
. "$HOME/.cargo/env"

eval "$(starship init bash)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

complete -C /usr/bin/terraform terraform

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
