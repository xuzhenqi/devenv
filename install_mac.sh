echo "Usage: sh install_mac.sh [NAME] [EMAIL]"
echo "Please first download clang(http://llvm.org/releases/download.html) into download/mac/, then press any keyboard..."
read temp
echo "[NAME]: $1"
echo "[EMAIL] $2"
echo "Starting Install ..."
PWD=`pwd`
# Mac
## TODO: install anaconda
mkdir download
wget -O download/Anaconda2-4.2.0-MacOSX-x86_64.sh https://repo.continuum.io/archive/Anaconda2-4.2.0-MacOSX-x86_64.sh
bash download/Anaconda2-4.2.0-MacOSX-x86_64.sh

## bash_profile
if [ ! -f '~/.bash_profile' ]; then
  touch ~/.bash_profile
fi
echo "
source $PWD/.bash_profile
" >> ~/.bash_profile
## submodule
git submodule update --init --recursive
## install brew
BREW_BIN=`which brew` && echo "Find brew in $BREW_BIN" 
BREW_BIN=`which brew` || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

function install() {
  for bin in $*; do
    path=`brew list | grep $bin`
    if [ "$path" = "" ]; then
      brew install $bin
      if [ "$bin" = "macvim" ]; then
        brew linkapps macvim
      fi
    else
      echo "$bin already installed."
    fi
  done
  return
}

install git macvim python cmake

# TODO: Check avalibility
brew cask install osxfuse
brew install sshfs 

## Setting up git
git config --global user.name "$1"
git config --global user.email "$2"
git config --global credential.helper osxkeychain

## Setting up vim
rm -rf ~/.vim ~/.vimrc
ln -sf $PWD/source/vim-pathogen/autoload .vim/autoload
if [ ! -d '.vim/indent' ]; then
mkdir .vim/indent
fi
ln -sf $PWD/source/google-vim/indent/google.vim .vim/indent/cpp.vim
if [ ! -d '.vim/bundle/YouCompleteMe/third_party/ycmd/clang_archives' ]; then
mkdir .vim/bundle/YouCompleteMe/third_party/ycmd/clang_archives
fi
ln -sf $PWD/download/mac/clang+llvm-3.9.0-x86_64-apple-darwin.tar.xz .vim/bundle/YouCompleteMe/third_party/ycmd/clang_archives/clang+llvm-3.9.0-x86_64-apple-darwin.tar.xz
cd .vim/bundle/YouCompleteMe/
./install.py --clang-completer
cd -
ln -sf $PWD/.vim ~/.vim
ln -sf $PWD/.vimrc ~/.vimrc
