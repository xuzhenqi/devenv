AUTOCONF=`which autoconf`
if [ "$AUTOCONF" = "" ]; then
    cd $DEV_HOME/development
    if [ ! -d autoconf-2.69 ]; then
        wget http://ftp.gnu.org/gnu/autoconf/autoconf-latest.tar.gz
        tar -xvf autoconf-latest.tar.gz
    fi
    cd autoconf-2.69
    ./configure --prefix=$DEV_HOME/local
    make -j`nproc`
    make install
fi
