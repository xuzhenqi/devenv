UNZIP=`which unzip`
if [ "$UNZIP" = "" ]; then
    if [ ! -d "$DEV_HOME/development/unzip60" ]; then
        wget -O ${DEV_HOME}/development/unzip60.tar.gz http://downloads.sourceforge.net/project/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/unzip60.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Finfozip%2Ffiles%2FUnZip%25206.x%2520%2528latest%2529%2FUnZip%25206.0%2F&ts=1483877202&use_mirror=nchc
        tar -xzf $DEV_HOME/development/unzip60.tar.gz -d $DEV_HOME/development
    fi
    cd ${DEV_HOME}/development/unzip60
    make prefix=$DEV_HOME/local/ MANDIR=$DEV_HOME/local/man/man1 -f unix/Makefile install
fi
