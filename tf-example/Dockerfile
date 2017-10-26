FROM tensorflow/tensorflow:1.3.0-gpu

MAINTAINER Ben Navetta <benjamin_navetta@brown.edu>

COPY tensorflow_example.py /usr/src/tensorflow_example.py

ENV LD_LIBRARY_PATH /usr/local/nvidia/lib64

CMD ["python", "/usr/src/tensorflow_example.py"]
