alias ls='ls -G --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll="ls -alF"
alias la='ls -A'
alias l='ls -CF'
alias tmux="tmux -2" # force tmux to use xterm-256color

# TODO: make DEV_HOME an option
export DEV_HOME=/data00/xuzhenqi 
export PATH=${DEV_HOME}/development/anaconda2/bin:${DEV_HOME}/local/bin:$PATH
export LD_LIBRARY_PATH=${DEV_HOME}/local/lib:$LD_LIBRARY_PATH
export CPPFLAGS="-I${DEV_HOME}/local/include":$CPPFLAGS
export LDFLAGS="-L${DEV_HOME}/local/lib":$LDFLAGS
