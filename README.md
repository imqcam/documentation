# IMQCAM Documentation

This public repository contains a [JupyterBook](https://jupyterbook.org/) for the IMQCAM Data Management platform.
It is automatically built into a Docker image using a GitHub Actions workflow.  The image
is pushed to a public DockerHub repository, deployed onto IMQCAM K8s cluster with Keel.sh 
and avaiable https://docs.imqcam.org.

To build locally:
```
pip install -r requirements.txt
jupyter-book build --all .
```

To build the Docker image locally:
```
docker build -t <org>/imqcam-docs .
```
