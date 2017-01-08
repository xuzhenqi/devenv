if [ ! -f "${PWD}/download/ffmpeg-master.zip" ]; then
   wget -O ${PWD}/download/ffmpeg-master.zip\
       https://github.com/FFmpeg/FFmpeg/archive/master.zip
fi

unzip ${PWD}/download/ffmpeg-master.zip -d ${PWD}/../

cd ${PWD}/../ffmpeg-master
./configure --prefix=${PWD}/../../local
make -j`nproc` && make install
