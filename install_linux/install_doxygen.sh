DOXYGEN=`which doxygen`
if [ "$DOXYGEN" = "" ]; then
    if [ ! -d "$DEV_HOME/development/doxygen-1.8.13" ]; then
        wget http://ftp.stack.nl/pub/users/dimitri/doxygen-1.8.13.linux.bin.tar.gz -O $DEV_HOME/development/doxygen-1.8.13.linux.bin.tar.gz
        cd $DEV_HOME/development
        tar -xvzf doxygen-1.8.13.linux.bin.tar.gz
    fi
    cp $DEV_HOME/development/doxygen-1.8.13/bin/doxygen $DEV_HOME/local/bin
fi
