CTAGS=`which ctags`
if [ "CTAGS" = "" ]; then
cd $DEV_HOME/development
wget http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
tar -xzf ctags-5.8.tar.gz
cd ctags-5.8
./configure --prefix=$DEV_HOME/local
make -j`nproc`
make install
fi
