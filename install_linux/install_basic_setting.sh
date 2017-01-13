if [ "${DEV_HOME}" = "" ]; then
    echo "[Error] DEV_HOME: ${DEV_HOME}"
fi
sed "/export DEV_HOME/c export DEV_HOME=${DEV_HOME}" $PWD/.bashrc
if [ ! -f '~/.bashrc' ]; then
  touch ~/.bashrc
fi
echo "To activate the env, please run"
echo "    source $PWD/.bashrc"
# TODO: make it a choice
# echo "
# source $PWD/.bashrc
# " >> ~/.bashrc
