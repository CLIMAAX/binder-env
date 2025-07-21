# CLIMAAX binder-env

An environment repository for binder to use with `nbgitpuller` so that binder can start with this environment and then pull in content from a workflow repository during launch. This reduces number of rebuilds of the container images as this repo sees much less activity than the individual workflow repos.


## Launch links

Use [this form](https://nbgitpuller.readthedocs.io/en/latest/link.html?tab=binder&branch=main&repo=https%3A%2F%2Fgithub.com%2Fclimaax%2Fbinder-env)  to create a binder launch link for a workflow repository that uses this repository for the environment. Note while filling out the form that we use `main` as the default branch name in CLIMAAX, while `master` is set as a default.


## Software

The Python environment is based on the reference environment from the [workflow_template](https://github.com/CLIMAAX/workflow_template/blob/main/environment.yml).


## Image

The Docker image is automatically build and pushed to the GitHub Packages repository from the `image` branch when a new version is tagged.
