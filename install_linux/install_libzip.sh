LIBZIP=`ls $DEV_HOME/local/lib | grep libzip`
if [ "$LIBZIP" = "" ]; then
    cd $DEV_HOME/development
    if [ ! -d "libzip-1.2.0" ]; then
        wget https://nih.at/libzip/libzip-1.2.0.tar.gz
        tar libzip-1.2.0.tar.gz 
    fi
    cd libzip-1.2.0
    ./configure --prefix=$DEV_HOME/local
    make -j`nproc`
    make install
fi
