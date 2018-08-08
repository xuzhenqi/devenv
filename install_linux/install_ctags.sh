set -e
if [ -f $DEV_HOME/local/bin/ctags ]; then
    echo "ctags already installed in `which ctags`"
    exit 0
fi
cd $DEV_HOME/development
if [ ! -d ctags-5.8 ]; then
wget http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
tar -xf ctags-5.8.tar.gz
fi
cd ctags-5.8
./configure --prefix=$DEV_HOME/local
make -j`nproc`
make install
