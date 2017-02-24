GTEST=`ls {$DEV_HOME}/local/lib | grep libgtest`
if [ "$GTEST" = "" ]; then
    if [ ! -d "$DEV_HOME/development/googletest-master" ]; then
        wget -O $DEV_HOME/development/googletest-master.zip \
            https://github.com/google/googletest/archive/master.zip
        cd $DEV_HOME/development
        unzip $DEV_HOME/development/googletest-master.zip
        cd -
    fi
    cd $DEV_HOME/development/googletest-master
    if [ ! -d "build" ]; then
        mkdir build
    fi
    cd build
    cmake -DBUILD_GTEST=ON -DBUILD_GMOCK=OFF \
        -DCMAKE_INSTALL_PREFIX=$DEV_HOME/local ..
    make -j`nproc`
    make install
else
    echo "GTEST is already installed."
fi
