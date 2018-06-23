FROM tensorflow/tensorflow:1.9.0-rc1-gpu-py3 

# Install some basic utilities
RUN apt-get update && apt-get install -y \
    ca-certificates \
    sudo \
    git \
    bzip2 \
    libgtk2.0-0 \
    libcanberra-gtk-module \
    vim \
    libsm6 \
    libxext6 \
    libx11-6 \ 
 && apt-get install -y --reinstall build-essential \
 && rm -rf /var/lib/apt/lists/*

# Create a working directory
WORKDIR /home

# Create a non-root user and switch to it
RUN adduser --disabled-password --gecos '' --shell /bin/bash user \
 && chown -R user:user /home \
 && echo "user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/90-user
USER user

# All users can use /home/user as their home directory
ENV HOME=/home/user
RUN chmod 777 /home/user
COPY ./conf/.vimrc $HOME 

# Install Miniconda
RUN curl -so ~/miniconda.sh https://repo.continuum.io/miniconda/Miniconda3-4.4.10-Linux-x86_64.sh \
 && chmod +x ~/miniconda.sh \
 && ~/miniconda.sh -b -p ~/miniconda \
 && rm ~/miniconda.sh
ENV PATH=/home/user/miniconda/bin:$PATH

# Install HDF5 Python bindings
RUN pip install --upgrade pip && pip install --no-cache-dir \
    Cython \
    numba \
    opencv-python \
    seaborn \
    numba \
    tqdm \
    jupyterlab \
    scikit-image \
    msgpack \
    bcolz \
    isoweek \
    graphviz \
    requests \
    h5py-cache \
    fastai \
    http://download.pytorch.org/whl/cu90/torch-0.4.0-cp36-cp36m-linux_x86_64.whl \
    torchvision \
    keras \
    tensorflow-gpu

# vim, vundle
RUN git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim \
 && vim +PluginInstall +qall 

# Install Torchnet, a high-level framework for PyTorch
#RUN pip install git+https://github.com/pytorch/tnt.git@master

# Set the default command to python3
CMD ["/bin/bash"]
