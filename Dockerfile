
# Use nvidia/cuda image
FROM nvidia/cuda:11.2.1-base-ubuntu20.04

# set bash as current shell
RUN chsh -s /bin/bash
SHELL ["/bin/bash", "-c"]
ENV DEBIAN_FRONTEND=nonintercative
# install anaconda
RUN apt-get update
RUN apt-get install -y wget bzip2 ca-certificates libglib2.0-0 libxext6 libsm6 libxrender1 git mercurial subversion && \
        apt-get clean
RUN wget --quiet https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh -O ~/anaconda.sh && \
        /bin/bash ~/anaconda.sh -b -p /opt/conda && \
        rm ~/anaconda.sh && \
        ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
        echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
        find /opt/conda/ -follow -type f -name '*.a' -delete && \
        find /opt/conda/ -follow -type f -name '*.js.map' -delete && \
        /opt/conda/bin/conda clean -afy

# set path to conda
ENV PATH /opt/conda/bin:$PATH
RUN apt-get install libatlas-base-dev -y

# setup conda virtual environment
COPY ./environment.yml /tmp/requirements.yaml
RUN conda update conda \
    && conda env create --name camera-seg -f /tmp/requirements.yaml

RUN echo "conda activate camera-seg" >> ~/.bashrc
ENV PATH /opt/conda/envs/camera-seg/bin:$PATH
ENV CONDA_DEFAULT_ENV $camera-seg
RUN pip3 install torchvision

RUN apt-get install ffmpeg libsm6 libxext6  -y
RUN apt install libilmbase-dev libopenexr-dev libgstreamer1.0-dev libavcodec-dev libavformat-dev libswscale-dev libwebp-dev -y
RUN pip3 install tqdm 
RUN pip3 install seaborn
COPY inference.py ./inference.py
RUN python3 inference.py



