set -e
PWD=`pwd`
# TODO: adding install scripts for users who are not sudoer

INSTALL_VIM="None" # [None, Apt, Source]

if [ ! -f '~/.bashrc' ]; then
  touch ~/.bashrc
fi
# TODO: make it a choice
echo "
source $PWD/.bashrc
" >> ~/.bashrc

git submodule update --init --recursive

# sudo apt-get install build-essential cmake python-dev

if [ "$INSTALL_VIM" = "" ]; then
  echo "Using avaliable vim"
elif [ "$INSTALL_VIM" = "Apt" ]; then
  # install vim8
  sudo apt-get install software-properties-common
  sudo add-apt-repository ppa:jonathonf/vim
  sudo apt-get update
  sudo apt-get install vim
elif [ "$INSTALL_VIM" = "Source" ]; then
  echo "Todo"
fi

rm -rf ~/.vim ~/.vimrc
ln -sf $PWD/source/vim-pathogen/autoload .vim/autoload
if [ ! -d '.vim/indent' ]; then
mkdir .vim/indent
fi
ln -sf $PWD/source/google-vim/indent/google.vim .vim/indent/cpp.vim
cd .vim/bundle/YouCompleteMe
./install.py --clang-completer
cd -

ln -sf $PWD/.vim ~/.vim
ln -sf $PWD/.vimrc ~/.vimrc

# install anaconda
# TODO: include a seperate space for self installed packages
bash download/Anaconda2-4.2.0-Linux-x86_64.sh
# TODO: set up jupyter notebook based on http://jupyter-notebook.readthedocs.io/en/latest/public_server.html

# install ffmpeg
# TODO: sudo or source
# install from source
wget -O ffmpeg-master.zip https://github.com/FFmpeg/FFmpeg/archive/master.zip
unzip ffmpeg-master.zip
cd ffmpeg-master
./configure --prefix=${PWD}/local
make -j`npro` && make install
