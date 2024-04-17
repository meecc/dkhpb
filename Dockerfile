# Paperspace base image is located in Dockerhub registry: paperspace/gradient_base
# Paperspace Fast.ai image is located Dockerhub registry: paperspace/fastai

# ==================================================================
# Initial Setup
# ------------------------------------------------------------------
    
    # FROM paperspace/gradient-base:pt112-tf29-jax0317-py39-20221019
    FROM paperspace/gradient-base:pt211-tf215-cudatk120-py311-20240202

# ==================================================================
# Directories & Tools
# ------------------------------------------------------------------

    RUN mkdir /content && \
        apt-get update -y && \
        apt-get install -y graphviz



# ==================================================================
# miniconda3
# ------------------------------------------------------------------

# RUN curl -o ~/miniconda.sh -O  https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh  && \
#      chmod +x ~/miniconda.sh && \
#      ~/miniconda.sh -b -p /opt/conda && \
#      rm ~/miniconda.sh && \
#     /opt/conda/bin/conda install conda-build

# ENV PATH=$PATH:/opt/conda/bin/
# ENV USER fastai
# # Create Environment
# # COPY environment.yaml /environment.yaml
# # RUN conda env create -f environment.yaml




# ==================================================================
# Fast.ai
# ------------------------------------------------------------------

    RUN python3 -m pip install --upgrade pip && \
        python3 -m pip install --upgrade fastai >=2.6.0 && \
        python3 -m pip install --upgrade fastbook && \
        python3 -m pip install --upgrade jupyterlab-git


# ==================================================================
# Config & Startup
# ------------------------------------------------------------------

    # ENV USER fastai
    WORKDIR /notebooks
    RUN chmod -R a+w /notebooks
    WORKDIR /notebooks

    COPY run.sh /run.sh
    RUN chmod a+x /run.sh

    CMD ["/run.sh"]
