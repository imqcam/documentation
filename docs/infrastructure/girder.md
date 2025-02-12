# Data Management 

[Girder](https://girder.readthedocs.io/) is an open-source, scalable and
extensible platform for data management. It provides core capabilities for data
organization (files, items, folders, and collections); user management and
authentication; access control and authorization. Girder's [plugin
architecture](https://girder.readthedocs.io/en/latest/plugins.html) simplifies
the process of implementing custom user interface components, REST APIs, and backend
capabilities. For example, the [Girder
Worker](https://girder-worker.readthedocs.io/en/latest/) plugin used by Whole
Tale enables distributed task execution based on Celery. 

Girder is the foundation of the Whole Tale platform and
[ytHub](https://hub.yt/), a repository of data for large-scale astrophysics
simulations.

## User Interface

The HTMDEC data portal user interface is illustrated in
{numref}`data-portal-fig`. Users can currently authenticate (a) using their
institutional credentials via the Globus Auth and the Oauth2 plugin (note: any
Oauth2 provider can be configured). """ Seedling data is organized into collections
(b) which can be shared with users or groups managed within the system. """
Specialized item preview (c) and plugins (d) can be used to enable data-specific
visualizations and inspection.

% https://docs.google.com/presentation/d/1sbtmNNwMalviSazailVha-7f7AanXEbKRc3B3X0nDu4/edit#slide=id.g2288bff466b_0_131
```{figure} images/data-portal.png
---
name: data-portal-fig
---
HTMDEC data portal user interface including (a) authentication with Oauth2, (b)
seedling-specific data collectins, (c) item preview, and (b) SEM plugins.
```

## Architecture

The Girder architecture is illustrated in {numref}`girder-fig`. Girder supports
storage and access to heterogeneous backend storage engines through a single
RESTful web API. Storage options include local filesystems, MongoDB databases,
and S3-compliant stores. For IMQCAM, primary data will generally be stored on a
distributed filesystem with metadata and some other assets managed in MongoDB
and an external graph database for GEMD data.

% https://docs.google.com/presentation/d/1sbtmNNwMalviSazailVha-7f7AanXEbKRc3B3X0nDu4/edit#slide=id.g2288bff466b_0_52
```{figure} images/girder.png
---
name: girder-fig
height: 400px
---
Girder data management platform architecture. 
```

The Girder worker plugin is used for job execution. Through Whole Tale, IMQCAM
uses the worker plugin to build container images, manage the container
lifecycle, and import data.

Additional plugins include:
* *Oauth2*: User authentication with Oauth2, currently based on Globus
  Authentication
* *Whole Tale*: A set of plugins enabling Whole Tale capabilities
