git submodule update --init --recursive

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
