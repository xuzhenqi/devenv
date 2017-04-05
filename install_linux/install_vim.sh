# install vim from source

sh install_linux/install_ctags.sh

VIM=`which vim`
if [ "$VIM" != "$DEV_HOME/local/bin/vim" ]; then
    echo "Install vim from souce"
    cd $DEV_HOME
    if [ ! -d $DEV_HOME/development/vim-7.4.2367 ]; then
        cd $DEV_HOME/development
        wget https://github.com/vim/vim/archive/v7.4.2367.tar.gz -O vim-7.4.2367.tar.gz
        tar -xvf vim-7.4.2367.tar.gz
    fi
    ./configure --with-features=huge --enable-multibyte --enable-pythoninterp=yes --enable-cscope --prefix=${DEV_HOME}/local
    make -j`nproc`
    make install
    cd ${DEV_HOME}/development/devenv
fi

git submodule update --init --recursive
rm -rf ~/.vim ~/.vimrc
ln -sf ${DEV_HOME}/development/devenv/source/vim-pathogen/autoload .vim/autoload
if [ ! -d '.vim/indent' ]; then
    mkdir .vim/indent
fi
ln -sf ${DEV_HOME}/development/devenv/source/google-vim/indent/google.vim .vim/indent/cpp.vim

# TODO: clang download
cd .vim/bundle/YouCompleteMe
./install.py --clang-completer
cd -

ln -sf ${DEV_HOME}/development/devenv/.vim ~/.vim
ln -sf ${DEV_HOME}/development/devenv/.vimrc ~/.vimrc
