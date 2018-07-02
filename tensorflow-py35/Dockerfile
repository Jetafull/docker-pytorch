FROM jetafull/deeplearning:cuda9.0

# Create a Python 3.6 environment                                                                                                                                               
RUN /home/user/miniconda/bin/conda install conda-build \                                                                                                                        
 && /home/user/miniconda/bin/conda create -y --name py35 python=3.5 \                                                                                                         
 && /home/user/miniconda/bin/conda clean -ya                                                                                                                                    
ENV CONDA_DEFAULT_ENV=py35                                                                                                                                                      
ENV CONDA_PREFIX=/home/user/miniconda/envs/$CONDA_DEFAULT_ENV                                                                                                                   
ENV PATH=$CONDA_PREFIX/bin:$PATH 

RUN pip install --no-cache-dir \
  matplotlib \
  seaborn    \
  tensorflow-gpu==1.8.0 \
  keras==2.2.0 \
  scipy \
  pandas \
  pillow 

 CMD ["/bin/bash"]

