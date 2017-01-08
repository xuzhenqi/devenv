TMUX=`which tmux`

if [ "$TMUX" = "" ]; then 
    # TODO: install from source
    # install libevent
    LIBEVENT=`find /lib /lib64 /usr/lib /usr/local/lib ${PWD}/../../local/lib -name libevent*.so`
    if [ "$LIBEVENT" = ""]; then
	echo "[INFO] libevent not found, install from source" 
	if [ ! -d "$PWD/../libevent-2.0.22-stable" ]; then
            wget -O $PWD/download/libevent-2.0.22-stable.tar.gz https://github.com/libevent/libevent/releases/download/release-2.0.22-stable/libevent-2.0.22-stable.tar.gz	
            tar -xzf $PWD/download/libevent-2.0.22-stable.tar.gz -d $PWD/..
	fi
        cd $PWD/../libevent-2.0.22-stable
       	./configure --prefix=$PWD/../../local 
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
    if [ ! -d "$PWD/../tmux-2.3" ]; then
        wget -O $PWD/../tmux-2.3.tar.gz https://github.com/tmux/tmux/releases/download/2.3/tmux-2.3.tar.gz
	tar -xzf $PWD/../tmux-2.3.tar.gz -d $PWD/..
    fi
    cd $PWD/../tmux-2.3
    ./configure --prefix=$PWD/../../local
    make -j`nproc`
    make install 
fi

ln -sf $PWD/.tmux.conf ~/.tmux.conf
