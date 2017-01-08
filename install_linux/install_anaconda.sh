if [ ! -f "${PWD}/download/Anaconda2-4.2.0-Linux-x86_64.sh" ]; then
    wget -O ${PWD}/download/Anaconda2-4.2.0-Linux-x86_64.sh \
        https://repo.continuum.io/archive/Anaconda2-4.2.0-Linux-x86_64.sh
fi

bash download/Anaconda2-4.2.0-Linux-x86_64.sh -b -p ${PWD}/../anaconda2
# TODO: set up jupyter notebook based on\
#    http://jupyter-notebook.readthedocs.io/en/latest/public_server.html
conda install libgcc # To solve LIBGCC_3.40 not found error
echo "[INFO] Set up jupyter notebook\
    http://jupyter-notebook.readthedocs.io/en/latest/public_server.html"