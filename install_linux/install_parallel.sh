set -e
PARALLEL=`which parallel`
if [ "$PARALLEL" = "" ]; then
    if [ ! -d "$DEV_HOME/devlopment/parallel-20161222" ]; then
        wget -O $DEV_HOME/development/parallel-20161222.tar.bz2 http://ftp.gnu.org/gnu/parallel/parallel-20161222.tar.bz2
        tar -jxf $DEV_HOME/development/parallel-20161222.tar.bz2 -O $DEV_HOME/development/parallel-20161222
    fi
    cd $DEV_HOME/development/parallel-20161222
    ./configure --prefix=$DEV_HOME/local
    make -j`nproc`
    make install
fi
