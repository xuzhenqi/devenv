set -e
if [ -d $DEV_HOME/development/anaconda2 ]; then
    echo "anaconda2 already installed."
    exit 0
fi

mkdir -p ${PWD}/download
if [ ! -f "${PWD}/download/Anaconda2-4.2.0-Linux-x86_64.sh" ]; then
    wget -O ${PWD}/download/Anaconda2-4.2.0-Linux-x86_64.sh \
        https://repo.continuum.io/archive/Anaconda2-4.2.0-Linux-x86_64.sh
fi

bash download/Anaconda2-4.2.0-Linux-x86_64.sh -b -p ${PWD}/../anaconda2
# TODO: set up jupyter notebook based on\
#    http://jupyter-notebook.readthedocs.io/en/latest/public_server.html
export PATH=${PWD}/../anaconda2/bin:$PATH
conda install -y libgcc # To solve LIBGCC_3.40 not found error
# jupyter notebook setting
jupyter notebook --generate-config
echo "c.NotebookApp.ip = '*'" >> ~/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.open_browser = False" >> ~/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.port = 9999" >> ~/.jupyter/jupyter_notebook_config.py

pip install -i https://mirrors.aliyun.com/pypi/simple/ ipdb
pip install -i https://mirrors.aliyun.com/pypi/simple/ flake8 # for vim-flake8 plugin
pip install -i https://mirrors.aliyun.com/pypi/simple/ gprof2dot # for profiling visualizatoin
pip install -i https://mirrors.aliyun.com/pypi/simple/ protobuf
