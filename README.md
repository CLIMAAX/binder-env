# CLIMAAX binder-env

An environment repository for binder to use with `nbgitpuller` so that binder can start with this environment and . We start from a custom Dockerfile based on an [image](https://github.com/jupyter/docker-stacks/blob/main/images/minimal-notebook/Dockerfile) that starts with Python 3.11 (CLIMAAX default), as the [default base environment](https://github.com/jupyterhub/repo2docker/blob/HEAD/repo2docker/buildpacks/conda/environment.yml) of binder uses Python 3.10 (as of July 2024).

[Form to create a binder link](https://nbgitpuller.readthedocs.io/en/latest/link.html?tab=binder&branch=main&repo=https%3A%2F%2Fgithub.com%2Fclimaax%2Fbinder-env) that uses this repository for the environment. Note while filling out the form that we use `main` as the default branch name in CLIMAAX, while `master` is set as a default.
