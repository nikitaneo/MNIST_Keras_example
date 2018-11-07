FROM continuumio/miniconda3:4.5.11

RUN pip install --upgrade pip
RUN pip install --no-cache-dir notebook==5.*
RUN pip install tensorflow
RUN pip install keras

ENV NB_USER student
ENV NB_UID 1000
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}
WORKDIR ${HOME}
