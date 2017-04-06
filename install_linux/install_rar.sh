RAR=`which rar`
if [ "$RAR" = "" ]; then
    cd $DEV_HOME/development
    if [ ! -d rar ]; then
        wget http://www.rarsoft.com/rar/rarlinux-x64-5.4.0.tar.gz
        tar -xvf rarlinux-x64-5.4.0.tar.gz 
    fi
    cd rar
    cp rar unrar $DEV_HOME/local/bin
    cp default.sfx $DEV_HOME/local/lib
fi
