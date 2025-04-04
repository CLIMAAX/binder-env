FROM quay.io/jupyter/minimal-notebook:python-3.12 AS base

LABEL org.opencontainers.image.description="CLIMAAX workflow environment image for binder"

COPY --chown=jovyan:users environment.yml /tmp/environment.yml
# Install conda packages directly into the base environment. The base environment
# of the jupyter image brings Python 3.11, same as our climaax conda environment.
RUN conda env update -n base -f /tmp/environment.yml && \
    conda clean -a -y && \
    rm -f /tmp/environment.yml

# https://mybinder.readthedocs.io/en/latest/tutorials/dockerfile.html
ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER=${NB_USER}
ENV NB_UID=${NB_UID}
ENV HOME=/home/${NB_USER}

USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}
