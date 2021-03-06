set -e
VALGRIND=`which valgrind`
if [ "$VALGRIND" = "" ]; then
    if [ ! -d "${DEV_HOME}/development/valgrind-3.12.0" ]; then
        wget -O $DEV_HOME/development/valgrind-3.12.0.tar.bz2 http://valgrind.org/downloads/valgrind-3.12.0.tar.bz2
        cd $DEV_HOME/development
        tar -xvjf $DEV_HOME/development/valgrind-3.12.0.tar.bz2
        cd -
    fi
    cd $DEV_HOME/development/valgrind-3.12.0
    # TODO: brk segment limit 8MB: https://bugs.kde.org/show_bug.cgi?id=352742
    ./configure --prefix=$DEV_HOME/local
    make -j`nproc`
    make install
else
    echo "valgrind is installed."
fi
