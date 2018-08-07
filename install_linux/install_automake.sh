set -e
AUTOMAKE=`which automake`
if [ "$AUTOMAKE" = "" ]; then
    cd $DEV_HOME/development
    if [ ! -d automake-1.15 ]; then
        wget http://ftp.gnu.org/gnu/automake/automake-1.15.tar.gz
        tar -xvf automake-1.15.tar.gz
    fi
    cd automake-1.15
    ./configure --prefix=$DEV_HOME/local
    make -j`nproc`
    make install
fi
