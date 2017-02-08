X264=`ls ${DEV_HOME}/local/lib | grep libx264`
if [ "$X264" = "" ]; then
    if [ ! -d "${DEV_HOME}/development/x264" ]; then
        cd ${DEV_HOME}/development
        git clone git://git.videolan.org/x264.git
    fi
    cd ${DEV_HOME}/development/x264
    ./configure --prefix=/data01/work/xuzhenqi/local --enable-static --disable-opencl --enable-shared --enable-pic --disable-asm
    make -j`nproc`
    make install
fi
