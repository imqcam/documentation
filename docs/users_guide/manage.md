(manage-data)=

# Managing Data

This section describes how to manage data in the HTMDEC DMS including:
* [Creating and managing access to collections](manage-collections)
* [Creating and managing folders](manage-folders)
* [Uploading folders and files](manage-upload)
* [Uploading folders and files using the ```girder-client```](manage-girder-client)
* [Ingesting data](manage-ingest)

(manage-collections)=
## Collections

Data in the IMQCAM portal is organized into collections with the three main collections relating to Processing (Enclave 1), Multiscale Modeling (Enclave 2), and Q&C (Enclave 3). Collections
are open for all IMQCAM members but Enclave PIs may request that write access be limited to specific team members.

After [signing in](signing-in) to your account, select the "Collections" link to
view any collections that you have access to. Select the collection that you
want to access.

```{figure} images/imqcam-collection.png
---
name: dms-collections-fig
height: 400px
---
```

(manage-folders)=

## Creating Folders

To create a new folder, select the dropdown on the right and "Create folder
here":

```{figure} images/imqcam-create-folder.png
---
name: dms-create-folder-fig
height: 200px
---
```

(manage-upload)=

## Uploading folders and files

To upload a file or folder, select the green upload icon:

```{figure} images/imqcam-collection-uploader.png
---
name: dms-upload-button-fig
height: 200px
---
```

Using the "Upload files" window, browse or drag-and-drop the files you want to
upload. Select "Start Upload" to initiate the upload process:

```{figure} images/imqcam-upload-files.png
---
name: dms-upload-files-fig
height: 200px
---
```

When uploading folders, you may be prompted to allow your browser to upload
multiple files:

```{figure} images/imqcam-upload-allow.png
---
name: dms-upload-allow-fig
height: 100px
---
```

(manage-girder-client)=
## Upload files and folder using ```girder-client```

It is also possible to upload files and folders from the command line using the
Python-based ```girder-client``` application. This requires that you configure
an API Key in the IMQCAM DMS system.

Install ```girder-client```:

```
pip install girder-client
```

```{note}
The girder-client version shoulb be >3.x.x
Check using this command: ```pip show girder-client```
```

To configure an API key for use with the ```girder-client```, select the "My
account" option from the user menu:

```{figure} images/imqcam-my-account.png
---
name: dms-my-account-fig
height: 200px
---
```

Select the "API keys" tab and then "Create new key":

```{figure} images/imqcam-api-keys.png
---
name: dms-api-keys
height: 200px
---
```

Name your API key and keep the default options then select "Create":

```{figure} images/imqcam-api-key-create.png
---
name: dms-api-key-create
height: 200px
---
```

Click the "show" link to view and copy your key:

```{figure} images/imqcam-api-key-show.png
---
name: dms-api-key-show
height: 200px
---
```

Now use the ```girder-client``` command line tool to upload:

```
girder-client --api-url https://data.htmdec.org/api/v1 --api-key API_KEY upload SERVER_REMOTE_PATH OR ID "YOUR_LOCAL_PATH"
```

For example, to upload the local folder "test" to the remote "Example" in the "Demo":

### Upload with help of SERVER_REMOTE_PATH: 

**How to get the path:**

Go inside the Collections, Select the right collection. Eg: Demo

```{figure} images/imqcam-collection.png
---
name: dms-api-keys
height: 300px
---
```

select the right folder eg: Example

```{figure} images/imqcam-collection-folder.png
---
name: dms-api-keys
height: 300px
---
```

FOR THE GIVEN example the SERVER_REMOTE_PATH is "Demo/Example"

```
girder-client --api-url https://data.htmdec.org/api/v1 --api-key API_KEY upload "/collection/Demo/Example" "./test"

Creating Folder from test
[####################################]  9.00/9.00  100%  file.txt
Creating Folder from test/subfolder
[####################################]  5.00/5.00  100%  file.txt
```


### Upload with help of ID:

**How to get the ID:**

Go inside the Collections, Select the right collection. Eg: Demo

```{figure} images/imqcam-collection.png
---
name: dms-api-keys
height: 300px
---
```

Copy the last ID from the URL like shown below

```{figure} images/imqcam-collection-id.png
---
name: dms-api-keys
height: 300px
---
```

```
girder-client --api-url https://data.htmdec.org/api/v1 --api-key API_KEY upload 6839b47028b402e4f5r4 "./test"
Creating Folder from test
[####################################]  9.00/9.00  100%  file.txt
Creating Folder from test/subfolder
[####################################]  5.00/5.00  100%  file.txt
```
  
(manage-ingest)=
**Transferring data**

When data needs to be transferred automatically or continuously, the DMS supports
several options:

* Direct transfer using the [manage-girder-client](manage-girder-client)
* Direct transfer using common protocols including SFTP, rsync, or Globus.
* Automated transfer using [OpenMSIStream](openmsistream)
