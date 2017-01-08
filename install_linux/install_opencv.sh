OPENCV=`ls ${DEV_HOME}/local/lib | grep libopencv_core`
if [ "$OPENCV" = "" ]; then
    if [ ! -d "${DEV_HOME}/development/opencv-2.4.13" ]; then
        wget -O ${DEV_HOME}/development/opencv-2.4.13.zip https://github.com/Itseez/opencv/archive/2.4.13.zip
        unzip ${DEV_HOME}/development/opencv-2.4.13.zip
    fi
    cd ${DEV_HOME}/development/opencv-2.4.13
    if [ ! -d "build" ]; then
        mkdir build
    fi
    cd build
    # TIFF is off because
    # http://answers.opencv.org/question/69481/undefined-reference-to-tiffreaddirectorylibtiff_40/
    cmake -D WITH_OPENCL=OFF -D WITH_CUDA=OFF -D BUILD_opencv_gpu=OFF \
    -DBUILD_opencv_gpuarithm=OFF -D BUILD_opencv_gpubgsegm=OFF \
    -DBUILD_opencv_gpucodec=OFF -D BUILD_opencv_gpufeatures2d=OFF \
    -DBUILD_opencv_gpufilters=OFF -D BUILD_opencv_gpuimgproc=OFF -D \
    BUILD_opencv_gpulegacy=OFF -D BUILD_opencv_gpuoptflow=OFF -D \
    BUILD_opencv_gpustereo=OFF -D BUILD_opencv_gpuwarping=OFF \ 
    -D WITH_TIFF=OFF \
    -D CMAKE_INSTALL_PREFIX=/data00/xuzhenqi/local ..
    make -j`nproc`
    make install
fi
