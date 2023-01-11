
# Use nvidia/cuda image
FROM ubuntu:latest

# install anaconda
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y python3-pip
# set path to conda
ENV PATH /opt/conda/bin:$PATH
RUN apt-get install libatlas-base-dev -y

# setup conda virtual environment
RUN pip install torchvision

RUN apt-get install ffmpeg libsm6 libxext6  -y
RUN apt install libilmbase-dev libopenexr-dev libgstreamer1.0-dev libavcodec-dev libavformat-dev libswscale-dev libwebp-dev -y
RUN pip install tqdm 
RUN pip install seaborn
RUN pip install cython matplotlib tqdm scipy ipython ninja yacs opencv-python ffmpeg opencv-contrib-python Pillow scikit-image scikit-learn lmfit imutils pyyaml jupyterlab==3 
RUN pip install gitpython
COPY inference.py ./inference.py




