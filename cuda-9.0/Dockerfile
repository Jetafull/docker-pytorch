FROM nvidia/cuda:9.0-runtime-ubuntu16.04

# Install some basic utilities
RUN apt-get update && apt-get install -y \
    curl \
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
RUN mkdir /app
WORKDIR /app

# Create a non-root user and switch to it
RUN adduser --disabled-password --gecos '' --shell /bin/bash user \
 && chown -R user:user /app \
 && echo "user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/90-user
USER user

# All users can use /home/user as their home directory
ENV HOME=/home/user
RUN chmod 777 /home/user

# Install Miniconda
RUN curl -so ~/miniconda.sh https://repo.continuum.io/miniconda/Miniconda3-4.4.10-Linux-x86_64.sh \
 && chmod +x ~/miniconda.sh \
 && ~/miniconda.sh -b -p ~/miniconda \
 && rm ~/miniconda.sh
ENV PATH=/home/user/miniconda/bin:$PATH

# Create a Python 3.6 environment
RUN /home/user/miniconda/bin/conda install conda-build \
 && /home/user/miniconda/bin/conda create -y --name py36 python=3.6.4 \
 && /home/user/miniconda/bin/conda clean -ya
ENV CONDA_DEFAULT_ENV=py36
ENV CONDA_PREFIX=/home/user/miniconda/envs/$CONDA_DEFAULT_ENV
ENV PATH=$CONDA_PREFIX/bin:$PATH

# Ensure conda version is at least 4.4.11
# (because of this issue: https://github.com/conda/conda/issues/6811)
ENV CONDA_AUTO_UPDATE_CONDA=false
RUN conda install -y "conda>=4.4.11" && conda clean -ya

# Install HDF5 Python bindings
RUN pip install --no-cache-dir \
    Cython \
    h5py \
    numba \
    opencv-python \
    seaborn \
    numba \
    tqdm \
    scipy \
    matplotlib \
    pandas \
    jupyterlab \
    scikit-learn \
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
    tensorflow-gpu \
    keras

# Install Torchnet, a high-level framework for PyTorch
#RUN pip install git+https://github.com/pytorch/tnt.git@master

# Set the default command to python3
CMD ["python3"]
