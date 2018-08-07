set -e
OPENCV=`ls ${DEV_HOME}/local/lib | grep libopencv_core`
if [ "$OPENCV" = "" ]; then
    if [ ! -d "${DEV_HOME}/development/opencv-2.4.13" ]; then
        wget -O ${DEV_HOME}/development/opencv-2.4.13.zip https://github.com/opencv/opencv/archive/2.4.13.zip
        cd ${DEV_HOME}/development
        unzip ${DEV_HOME}/development/opencv-2.4.13.zip
        cd -
    fi
    cd ${DEV_HOME}/development/opencv-2.4.13
    if [ ! -d "build" ]; then
        mkdir build
    fi
    cd build
    # TIFF is off because
    # http://answers.opencv.org/question/69481/undefined-reference-to-tiffreaddirectorylibtiff_40/
    # build without gpu
    cmake -DWITH_OPENCL=OFF -DWITH_CUDA=OFF -DBUILD_opencv_gpu=OFF \
    -DBUILD_opencv_gpuarithm=OFF -DBUILD_opencv_gpubgsegm=OFF \
    -DBUILD_opencv_gpucodec=OFF -DBUILD_opencv_gpufeatures2d=OFF \
    -DBUILD_opencv_gpufilters=OFF -DBUILD_opencv_gpuimgproc=OFF \
    -DBUILD_opencv_gpulegacy=OFF -DBUILD_opencv_gpuoptflow=OFF \
    -DBUILD_opencv_gpustereo=OFF -DBUILD_opencv_gpuwarping=OFF \
    -DWITH_TIFF=OFF \
    -DBUILD_SHARED_LIBS=OFF \
    -DWITH_LAPACK=OFF \
    -DCMAKE_INSTALL_PREFIX=$DEV_HOME/local ..

    # build with gpu
    # cmake -DWITH_OPENCL=OFF -DWITH_TIFF=OFF \
    #     -DPYTHON_LIBRARY=$(python-config --prefix)/lib/libpython2.7.so \
    #     -DPYTHON_INCLUDE_DIR=$(python-config --prefix)/include/python2.7 \
    #     -DCMAKE_INSTALL_PREFIX=$DEV_HOME/local ..
    make -j`nproc`
    make install
fi
