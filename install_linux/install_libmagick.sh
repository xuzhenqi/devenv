set -e
cd $DEV_HOME/development
if [ ! -d ImageMagick-7.0.7-8 ]; then
    # TODO(xzq): using specific version url
    wget https://www.imagemagick.org/download/ImageMagick.tar.gz -O ImageMagick.tar.gz
    tar -xf ImageMagick.tar.gz
fi
cd ImageMagick-7.0.7-8
./configure --prefix=$DEV_HOME/local
make -j`nproc`
make install
