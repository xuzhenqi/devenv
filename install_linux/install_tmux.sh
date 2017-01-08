TMUX=`which tmux`

if [ "$TMUX" = "" ]; then 
    # TODO: install from source
fi

ln -s $PWD/.tmux.conf ~/.tmux.conf
