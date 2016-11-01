set -e
PWD=`pwd`

if [ ! -f '~/.bashrc' ]; then
  touch ~/.bashrc
fi
# TODO: make it a choice
echo "
source $PWD/.bashrc
" >> ~/.bashrc

git submodule update --init --recursive

sudo apt-get install build-essential cmake python-dev

# install vim8
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:jonathonf/vim
sudo apt-get update
sudo apt-get install vim

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
