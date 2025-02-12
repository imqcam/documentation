(wholetale)=
# Data Analysis 

The IMQCAM data management system uses Whole Tale to provide access to 
customizable, container-based interactive analysis environments such as
JupyterLab, RStudio, and MATLAB. 

Whole Tale enables the following capabilities for seedling researchers:
* Interactively analyze and visualized IMQCAM data in the cloud
* Create and share reproducible computational research environments and
  artifacts
* Configure computational environments with the exact versions of operations
  system and software used to obtain results
* Publish research artifacts to popular research archives, such as Zenodo

The IMQCAM data portal user interface is illustrated in
{numref}`wholetale-fig` illustrates the Whole Tale capabilities provided to
IMQCAM seedling collaborators.  From within the IMQCAM data portal, users can
select data to be analyzed in Whole Tale (a) and browse or share existing tales
with other users (b). Tales (c) are customizable container images based on comment
IDEs such as JupyterLab (d).

% https://docs.google.com/presentation/d/1sbtmNNwMalviSazailVha-7f7AanXEbKRc3B3X0nDu4/edit#slide=id.g2288bff466b_0_131
```{figure} images/wholetale.png
---
name: wholetale-fig
height: 400px
---
Whole Tale user interface including (a) analyze in Whole Tale from Girder, (b)
Tale dashboard, (c) Tale metadata, (d) JupyterLab interface
```

## About Whole Tale

[Whole Tale](https://wholetale.readthedocs.io/) is an open-source, scalable
web-based platform for transparent and reproducible computational research.
The primary goal of the platform is to simplify the process of creating,
sharing, publishing, re-executing, and verifying published computational
research artifacts, called _tales_. Tales are standards-based composite objects
that capture the data, code, and complete software environment used to produce
findings.
