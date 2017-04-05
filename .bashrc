PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
alias ls='ls -G --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll="ls -alF"
alias la='ls -A'
alias l='ls -CF'
alias tmux="tmux -2" # force tmux to use xterm-256color
alias vim="vim -u $DEV_HOME/development/devenv/.vimrc"

export LANG="en_US.UTF-8"
export LC_ALL="zh_CN.UTF-8"

export PATH=${DEV_HOME}/development/anaconda2/bin:${DEV_HOME}/local/bin:$PATH
export LD_LIBRARY_PATH=${DEV_HOME}/local/lib:$LD_LIBRARY_PATH
export CPPFLAGS="-I${DEV_HOME}/local/include":$CPPFLAGS
export LDFLAGS="-L${DEV_HOME}/local/lib":$LDFLAGS
export PKG_CONFIG_PATH="$DEV_HOME/local/lib/pkgconfig":$PKG_CONFIG_PATH
export PYTHONPATH="$DEV_HOME/local/lib/python2.7/site-packages":$PYTHONPATH
