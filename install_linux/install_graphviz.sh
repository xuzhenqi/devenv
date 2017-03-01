DOT=`which dot`
if [ "$DOT" = "" ]; then
    if [ ! -d "$DEV_HOME/development/graphviz-2.40.1" ]; then
        wget -O $DEV_HOME/development/graphviz-2.40.1.tar.gz http://www.graphviz.org/pub/graphviz/stable/SOURCES/graphviz-2.40.1.tar.gz
        cd $DEV_HOME/development
        tar -xvzf $DEV_HOME/development/graphviz-2.40.1.tar.gz
        cd -
    fi
    cd $DEV_HOME/development/graphviz-2.40.1
    ./configure --prefix=$DEV_HOME/local
    make -j`nproc`
    make install
else
    echo "graphviz is installed."
fi
