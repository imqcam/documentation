(users-guide-overview)=
# Overview

Materials researchers need collaborative tools for data curation. Too often,
acquired data and other research artifacts are stored on local systems for
analysis or shared using common cloud-based file management tools that are
ill-suited for research artifact curation.

The IMQCAM digital twin environment provides a centralized portal for the
management of data and software artifacts for materials researchers. It consists of
the following:

* [Data Catalog](ug-sec-data-catalog): a scalable web-based portal for the
  curation, sharing, and preservation of research artifacts.
* [Analysis Dashboard](ug-sec-dashboard): a web-based service for the creation,
  sharing, and publishing of transparent and reproducible analyses.

(ug-sec-data-catalog)=
## Data Catalog

The Data Catalog (https://data.imqcam.org/) is a scalable web-based portal that
allows researchers to transfer, organize, annotate, and share research artifacts
with others. 

```{figure} images/imqcam-data-catalog.png
---
name: dms-catalog
height: 400px
---
IMQCAM Data Catalog
```

Key features include:
* Web-based user interface that supports basic data management functions
  (upload, create/rename/delete, access control, metadata/annotation)
* Authentication using your institutional credentials
* Complete REST-based API (https://data.imqcam.org/api/v1)
* Python toolkit and command-line utilities 


(ug-sec-dashboard)=
## Analysis Dashboard

The Analysis Dashboard (https://dashboard.imqcam.org/) enables users to create
and share analysis environments (called *tales*) based on popular tools
including Jupyter and MATLAB. 

```{figure} images/imqcam-tale-dashboard.png
---
name: dms-dashboard
height: 400px
---
IMQCAM Analysis Dashboard
```

Key features include:
* Web-based user interface that supports the creation and sharing of custom
  computational environments using Docker
* Interactive access to data in the IMQCAM Data Catalog
* Reproducible and transparent analysis
* Publishing computational artifacts
* Complete REST-based API

