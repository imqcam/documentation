(tutorial)=
# Tutorial
In this tutorial you will:
* Register and sign in to your DMS account
* Create a folder and upload a file to the Tutorial collection
* Create metadata
* Change permissions 
* Run an example analysis


## Register and sign in

To register to use the DMS, follow the [registration](signing-in) instructions.
We recommend that you use existing credentials from one of the supported
providers (institution, GitHub, ORCID, or Google).

```{note}
Once registered, your account will be approved and granted access to the
Tutorial Collection in the DMS.
```

## Organizing data

Data is organized in the DMS using files, collections, folders and items.

**Files** represent raw data objects, like typical files in a filesystem, but can
be stored in a variety of ways (e.g., filesystem, object store). The DMS
supports different types of storage (regular filesystem, object store, GridFS)
for the raw bytes. 

The files can be organized into a hierarchy consisting of three elements:

* **Collection**: Top level or root container or folder. In the DMS, collections are used to organize data for a particular project or collaboration.
* **Folder**: Standard folder structure that contain other folders or items.
* **Item**: An abstraction over the traditional file concept, items can contain one or more files. In this way, a single item may be composed of multiple files managed together

## Tutorial collection

You will be granted access to the Tutorial Collection and given permission to
create folders and upload files.

## Create a folder

To create a folder, select the hierarchy dropdown and then **Create folder
here**:

```{figure} images/tutorial/tutorial-create-folder.png
---
name: dms-tutorial-create-folder
---
```

This will open the **Create folder** dialog where you can specify the folder
name and optional description:

```{figure} images/tutorial/tutorial-create-folder-dialog.png
---
name: dms-tutorial-create-folder-dialog
---
```

## Adding metadata
The DMS supports a flexible metadata system. Metadata is used to support
discovery and description of curated assets.

Metadata can be added to any object as key-value pairs or semi-structured JSON. Select the **+** button on the
**Metadata** panel and select **Simple** for key-value metadata:

```{figure} images/tutorial/tutorial-add-metadata.png
---
name: dms-tutorial-add-metadata
---
```

Enter your key and value then select the **Check** to apply your change.
Metadata fields can be edited and deleted.

## Change permissions

To change permissions on an object, select the yellow **Lock** icon. From here
you can add, edit, or remove access for DMS users and groups.

```{figure} images/tutorial/tutorial-access-control.png
---
name: dms-tutorial-access-control
---
```

## Upload a file

For this tutorial, download the file {download}`F144_R5C7_01.tif<files/F144_R5C7_01.tif>` 
to your local system, an SEM image from the JHU seedling.  

Upload the image to the folder you created in the previous step. Select the
green **Upload** button and browse your local system to select the file. 

Once uploaded, you should see a preview of the uploaded SEM image:

```{figure} images/tutorial/tutorial-sem-preview.png
---
name: dms-tutorial-sem-preview
---
```

From this view, you can add metadata to describe the file.



## Run an existing analysis

To run an existing analysis:
* Select the **Tale Dashboard** link 
* Select the **Public Tales** link 
* Find the **HTMDEC DMS Tutorial** tale and select **View**

```{figure} images/tutorial/tutorial-public-tales.png
---
name: dms-tutorial-public-tales
---
```

```{figure} images/tutorial/tutorial-tale.png
---
name: dms-tutorial-tale
---
```

Select the **Run Tale** button.  Because you are not an owner or editor of this
tale, you will be prompted to make a copy. Select **Confirm** and then **Run
Tale** on your copy to start an instance of the analysis environment.

```{figure} images/tutorial/tutorial-tale-copy-run.png
---
name: dms-tutorial-tale-copy-run
---
```

Select the **Run Tale** button again to start your copy of the tale. You will
see a progress bar as the environment is started:

```{figure} images/tutorial/tutorial-tale-starting.png
---
name: dms-tutorial-tale-starting
---
```

Once started, a JupyterLab environment will display.  Optionally select the
**popout** icon to open the instance in a new tab or window. 

```{figure} images/tutorial/tutorial-tale-started.png
---
name: dms-tutorial-tale-started
---
```

Open **alpss_run.ipynb** and run the cells to explore the tutorial
notebook.

```{figure} images/tutorial/tutorial-tale-notebook.png
---
name: dms-tutorial-tale-notebook
---
```



