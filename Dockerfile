# There is an issue between jupyterlab>4.2 and jupyterlab-myst where links
# are not highlighted properly: https://github.com/jupyter-book/jupyterlab-myst/issues/248
FROM quay.io/jupyter/minimal-notebook:lab-4.2.6 AS base

LABEL org.opencontainers.image.description="CLIMAAX workflow environment image for binder"

COPY --chown=jovyan:users environment.yml /tmp/environment.yml
# Install conda packages directly into the base environment. The base environment
# of the jupyter image brings Python 3.12 (as of April 2025), same as our climaax
# conda environment.
RUN mamba env update -n base -f /tmp/environment.yml && \
    mamba clean -a -y && \
    pip cache purge && \
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
