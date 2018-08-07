set -e
ZIP=`which zip`
if [ "$ZIP" = "" ]; then
    cd $DEV_HOME/development
    if [ ! -d "zip30" ]; then
        wget -O zip30.tar.gz https://downloads.sourceforge.net/project/infozip/Zip%203.x%20%28latest%29/3.0/zip30.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Finfozip%2Ffiles%2FZip%25203.x%2520%2528latest%2529%2F3.0%2F&ts=1497348991&use_mirror=jaist
        tar -xzf zip30.tar.gz
    fi
    cd zip30
    make -f unix/Makefile generic
    make prefix=$DEV_HOME/local -f unix/Makefile install
fi
