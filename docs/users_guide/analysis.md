(analysis)=
# Analyzing Data

In addition to [uploading and managing](manage-data) your data, the HTMDEC DMS
allows you to create and share reproducible analysis environments. Using the
**Whole Tale** platform, you can create custom **tales** containing analysis
scripts, data, results, and software dependencies that can be shared with others
or deposited in archival repositories.

## Creating a new tale

To access the Analysis Dashboard, select the **Tale Dashboard** link at the top
of the DMS portal. Select the **Create New Tale** to create a blank tale or
**Create New Tale from Git Repository** to create a tale based on an existing
public repository.

```{figure} images/imqcam-tale-create-dashboard.png
---
name: dms-tale-dashboard
---
```

Enter the title for your tale and select the desired compute environment.
Supported environments include **JupyterLab** and **MATLAB**.

```{figure} images/imqcam-tale-create.png
---
name: dms-tale-create
---
```

Select the **Run Tale** button to start the selected interactive analysis
environment:

```{figure} images/imqcam-tale-running.png
---
name: dms-tale-running
---
```

## Customizing the environment

You can customize your tale environment by declaring any software dependencies
in a set of simple text files. These are used to build a Docker image that is
used to run your code.

For details, see the Whole Tale documentation [Customizing the
environment](https://wholetale.readthedocs.io/en/stable/users_guide/customizing.html).


## Sharing your tale

Select the **Share** tab to share your tale environment with other DMS users:

```{figure} images/imqcam-tale-sharing.png
---
name: dms-tale-sharing
---
```

## Creating a new tale with data

You can also create a new tale by selecting the **play** button from within a
selected folder.

```{figure} images/-tale-play.png
---
name: dms-tale-play
---
```
