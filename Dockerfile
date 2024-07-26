FROM quay.io/jupyter/minimal-notebook:lab-4.2.4 AS base

# Copy environment and initialization scripts
COPY --chown=jovyan:users environment.yml /tmp/environment.yml

# Install conda packages directly into the base environment, so that command
# line tools are accessible from the default terminal and inside all notebooks.
# The base environment of the jupyter image brings Python 3.11, same as our
# climaax conda environment.
RUN conda update --name base conda -y && \
    conda env update -n base -f /tmp/environment.yml && \
    conda clean -a -y && \
    rm -f /tmp/environment.yml

#USER root
#RUN apt update && apt install git curl jq -y

ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

#RUN adduser --disabled-password \
#    --gecos "Default user" \
#    --uid ${NB_UID} \
#    ${NB_USER}

# Make sure the contents of our repo are in ${HOME}
#COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}
