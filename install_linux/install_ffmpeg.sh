FFMPEG=`which ffmpeg`
if [ "$FFMPEG" != "${DEV_HOME}/local/bin/ffmpeg" ]; then
    echo "ffmpeg not found."
    if [ ! -d "${DEV_HOME}/development/FFmpeg-master" ]; then
        echo "Download ffmpeg"
        wget -O ${DEV_HOME}/development/devenv/download/ffmpeg-master.zip\
            https://github.com/FFmpeg/FFmpeg/archive/master.zip
        unzip ${DEV_HOME}/development/devenv/download/ffmpeg-master.zip -d ${DEV_HOME}/development
    fi

    cd ${DEV_HOME}/development/FFmpeg-master
    ./configure --prefix=${DEV_HOME}/local --disable-yasm --enable-shared --enable-pic --enable-libx264 --enable-gpl --extra-cflags=-I$CPPFLAGS
    make -j`nproc` && make install
fi
