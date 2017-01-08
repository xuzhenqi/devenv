# install vim from source

sh install_linux/install_ctags.sh

VIM=`which vim`
if [ "$VIM" != "$DEV_HOME/local/bin/vim" ]; then
    echo "Install vim from souce"
    cd $DEV_HOME
    if [ ! -d $DEV_HOME/vim ]; then
        git clone git@github.com:vim/vim.git
    fi
    cd vim/src
    ./configure --with-features=huge --enable-multibyte --enable-pythoninterp=yes --enable-cscope --prefix=${DEV_HOME}/local
    make -j`nproc`
    make install
    cd ${DEV_HOME}/devenv
fi

git submodule update --init --recursive
rm -rf ~/.vim ~/.vimrc
ln -sf ${DEV_HOME}/devenv/source/vim-pathogen/autoload .vim/autoload
if [ ! -d '.vim/indent' ]; then
    mkdir .vim/indent
fi
ln -sf ${DEV_HOME}/devenv/source/google-vim/indent/google.vim .vim/indent/cpp.vim
cd .vim/bundle/YouCompleteMe
./install.py --clang-completer
cd -

ln -sf ${DEV_HOME}/devenv/.vim ~/.vim
ln -sf ${DEV_HOME}/devenv/.vimrc ~/.vimrc
