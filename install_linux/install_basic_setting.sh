if [ ! -f '~/.bashrc' ]; then
  touch ~/.bashrc
fi
# TODO: make it a choice
echo "
source $PWD/.bashrc
" >> ~/.bashrc
