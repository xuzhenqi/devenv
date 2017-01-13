set -e
PWD=`pwd`
DEV_HOME=${PWD%/*}

sh install_linux/install_basic_setting.sh
sh install_linux/install_anaconda.sh
sh install_linux/install_vim.sh
sh install_linux/install_unzip.sh
sh install_linux/install_tmux.sh
sh install_linux/install_libx264.sh
sh install_linux/install_ffmpeg.sh
