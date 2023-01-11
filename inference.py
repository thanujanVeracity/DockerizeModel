# -*- coding: utf-8 -*-

#! /usr/bin/python3
# train.py
# Author Thanujan T

import torch
import matplotlib.pyplot as plt
import os
def inference():
    model = torch.hub.load('ultralytics/yolov5', 'yolov5s')
    img = 'https://i.ytimg.com/vi/q71MCWAEfL8/maxresdefault.jpg'  # or file, Path, PIL, OpenCV, numpy, list
    results = model(img)
    fig, ax = plt.subplots(figsize=(16, 12))
    ax.imshow(results.render()[0])
    plt.savefig('output.jpg')


if __name__ == '__main__':
    
    
    inference()
    print("Abs path : ",os.path.abspath("output.jpg"))


