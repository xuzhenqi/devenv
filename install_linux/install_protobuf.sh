set -e

if [ -f $DEV_HOME/local/bin/protoc ]; then
    echo "protoc already installed in `which protoc`"
    exit 0
fi

cd $DEV_HOME/development

if [ ! -d protobuf-3.6.1 ]; then
    wget https://github.com/protocolbuffers/protobuf/releases/download/v3.6.1/protobuf-all-3.6.1.tar.gz 
    tar -xf protobuf-all-3.6.1.tar.gz
fi

cd protobuf-3.6.1
./configure --prefix=$DEV_HOME/local
make -j`nproc`
make install
