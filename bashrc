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

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

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

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

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

alias kcc='kubectl config current-context'
alias klc='kubectl config get-contexts'
alias kuc='kubectl config use-context'
alias kaf='kubectl apply -f'
alias go='http_proxy=http://10.151.100.200:3128 https_proxy=http://10.151.100.200:3128 go'
export E3D_DEV='http://e3d.tri-dev-k8s.fincoreltd.rs'
export http_proxy="http://10.151.5.200:3128"
export https_proxy="http://10.151.5.200:3128"
export HTTP_PROXY="http://10.151.5.200:3128"
export HTTPS_PROXY="http://10.151.5.200:3128"
export NO_PROXY="127.0.0.1,localhost,dt-amihajlov-ul,*.finbet.com,*.fincoreltd.rs"
export E3D="http://dt-amihajlov-ul:8080/markets/"
export E3DEVENTS="http://dt-amihajlov-ul:8080/events/"
export E3DMARKETS="http://dt-amihajlov-ul:8080/markets/"
export E3DMARKETS_DEV="$E3D_DEV/markets/"
export E3DCOMPETITIONS="http://dt-amihajlov-ul:8080/competitions/"
alias ll="ls -l" 
alias mergenocommit="git merge --no-commit --no-ff"
alias gitlog="git log --oneline --graph --color --all --decorate"
alias gupavom='git pull --rebase --autostash -v origin master'
alias uncommit='git reset --soft HEAD~1'
alias klcfaws='kubectl -n pp-uat-faws'
alias nv='nvim'
export GO111MODULE=auto

export PATH=$PATH:/usr/local/go/bin:/home/sodsman/go/bin/:/usr/local/pgsql/bin:/usr/local/bin:/home/sodsman/scripts:/opt/eclipse:/home/sodsman/sonar-scanner/bin
export GOPATH=/home/sodsman/go
export GOLANG_PROTOBUF_REGISTRATION_CONFLICT=warn
#git filter-branch --index-filter "git rm -rf --cached --ignore-unmatch client" HEAD 
export NODE_EXTRA_CA_CERTS=/home/sodsman/cert_Finbet_fproxy_cert.crt
export NODE_OPTIONS=--use-openssl-ca
export SONAR_TOKEN=squ_9a2d1bb5d0a54e10adc5786180313e69a35077da
export LD_LIBRARY_PATH=/usr/lib/oracle/21/client64/lib
export VAR66=77
#kubectl get configmaps
#kubectl get configmaps translcached -o yaml
#kubectl get secrets translcached -o yaml
#xwd | convert xwd:- e3dummy_web.png
source <(kubectl completion bash)
alias k=kubectl
complete -o default -F __start_kubectl k
