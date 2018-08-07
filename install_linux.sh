set -e
PWD=`pwd`
DEV_HOME=${PWD%/*}
export DEV_HOME=${DEV_HOME%/*}

sh install_linux/install_basic_setting.sh
sh install_linux/install_anaconda.sh
sh install_linux/install_vim.sh
sh install_linux/install_unzip.sh
sh install_linux/install_tmux.sh
sh install_linux/install_libx264.sh
sh install_linux/install_ffmpeg.sh
sh install_linux/install_parallel.sh
sh install_linux/install_eigen.sh
sh install_linux/install_ctags.sh
sh install_linux/install_doxygen.sh
sh install_linux/install_exiftool.sh
sh install_linux/install_graphviz.sh
sh install_linux/install_gtest.sh
sh install_linux/install_opencv.sh
sh install_linux/install_valgrind.sh
