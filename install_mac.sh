set -e
PWD=`pwd`
# Mac
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
BREW_BIN=`which brew`
if [ BREW_BIN == "" ]; then
echo "No brew found! Install it"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
echo "Find brew in $BREW_BIN"
fi

function install() {
  for bin in $*; do
    path=`brew list | grep $bin`
    if [ path == "" ]; then
      brew install $bin
    else
      echo "$bin already installed."
    fi
  done
  return 
}

install git macvim python cmake

## Setting up git
git config --global user.name "xuzhenqi"
git config --global user.email "xuzhenqi1993@gmail.com"
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
