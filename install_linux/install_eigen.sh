if [ ! -d "${DEV_HOME}/local/include/eigen3" ]; then
    if [ ! -d "$DEV_HOME/development/eigen-eigen-da9b4e14c255" ]; then
        wget -O "$DEV_HOME/development/eigen3.tar.bz2" \
            http://bitbucket.org/eigen/eigen/get/3.3.2.tar.bz2
        cd "$DEV_HOME/development/"
        tar -xvjf eigen3.tar.bz2
        cd -
    fi
    cd "$DEV_HOME/development/eigen-eigen-da9b4e14c255" 
    mkdir build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX="$DEV_HOME/local"
    make install
else
    echo "Eigen3 is already installed in ${DEV_HOME}/local/include/eigen3"
fi
