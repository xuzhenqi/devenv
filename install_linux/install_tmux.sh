set -e
TMUX=`which tmux`

if [ "$TMUX" = "" ]; then 
    # install libevent
    LIBEVENT=`find /lib /lib64 /usr/lib /usr/local/lib $DEV_HOME/local -name libevent*.so`
    if [ "$LIBEVENT" = "" ]; then
        echo "[INFO] libevent not found, install from source" 
        cd $DEV_HOME/development
        if [ ! -d "libevent-2.1.8-stable" ]; then
            wget -O libevent-2.1.8-stable.tar.gz https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz	
            tar -xzf libevent-2.1.8-stable.tar.gz
        fi
        cd libevent-2.1.8-stable
        ./configure --prefix=$DEV_HOME/local 
        make -j`nproc`
        make install
    else
        echo "[INFO] Find libevent in $LIBEVENT"
    fi

    # install ncurses
    NCURSES=`find /lib /lib64 /usr/lib /usr/local/lib ${PWD}/../../local/lib -name libncurses*.so`
    if [ "$NCURSES" = "" ]; then
        echo "[INFO] libncurses not found, install from source"
        if [ ! -d "$PWD/../ncurses-5.9" ]; then
            wget -O $PWD/../ncurses-5.9.tar.gz http://invisible-mirror.net/archives/ncurses/ncurses-5.9.tar.gz
            tar -xzf $PWD/../ncurses-5.9.tar.gz -d $PWD/..
        fi
        cd $PWD/../ncurses-5.9
        ./configure --prefix=$PWD/../../local --with-pkg-config=$PWD/../../local/lib/pkgconfig --enable-pc-files
        make -j`nproc`
        make install
    else
        echo "[INFO] Find libncurses in $NCURSES"
    fi

    # install tmux
    cd $DEV_HOME/development
    if [ ! -d "tmux-2.3" ]; then
        wget -O tmux-2.3.tar.gz https://github.com/tmux/tmux/releases/download/2.3/tmux-2.3.tar.gz
        tar -xzf tmux-2.3.tar.gz
    fi
    cd tmux-2.3
    ./configure --prefix=$DEV_HOME/local
    make -j`nproc`
    make install 
fi

ln -sf $DEV_HOME/development/devenv/.tmux.conf ~/.tmux.conf
