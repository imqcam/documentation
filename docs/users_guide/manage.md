(manage-data)=
# Managing Data

This section describes how to manage data in the IMQCAM portal including
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

```{figure} images/imqcam-select-collection.png
---
name: dms-collections-fig
height: 400px
---
```

(manage-folders)=
## Creating Folders

To create a new folder, select the dropdown on the right and "Create folder
here":

```{figure} images/htmdec-create-folder.png
---
name: dms-create-folder-fig
height: 200px
---
```

(manage-upload)=
## Uploading folders and files

To upload a file or folder, select the green upload icon:

```{figure} images/htmdec-folder-upload-metadata.png
---
name: dms-upload-button-fig
height: 200px
---
```

Using the "Upload files" window, browse or drag-and-drop the files you want to
upload. Select "Start Upload" to initiate the upload process:

```{figure} images/htmdec-upload-files-folders.png
---
name: dms-upload-files-fig
height: 200px
---
```

When uploading folders, you may be prompted to allow your browser to upload
multiple files:

```{figure} images/htmdec-upload-allow.png
---
name: dms-upload-allow-fig
height: 100px
---
```



(manage-girder-client)=
## Upload files and folder using ```girder-client```

It is also possible to upload files and folders from the command line using the
Python-based ```girder-client``` application. This requires that you configure
an API Key in the HTMDEC DMS system.

Install ```girder-client```:

```
pip install girder-client
```


To configure an API key for use with the ```girder-client```, select the "My
account" option from the user menu:

```{figure} images/htmdec-my-account.png
---
name: dms-my-account-fig
height: 200px
---
```

Select the "API keys" tab and then "Create new key":

```{figure} images/htmdec-api-keys.png
---
name: dms-api-keys
height: 200px
---
```

Name your API key and keep the default options then select "Create":

```{figure} images/htmdec-api-key-create.png
---
name: dms-api-key-create
height: 200px
---
```

Click the "show" link to view and copy your key:

```{figure} images/htmdec-api-key-show.png
---
name: dms-api-key-show
height: 200px
---
```

Now use the ```girder-client``` command line tool to upload:

```
girder-client --api-url https://data.htmdec.org/api/v1 --api-key API_KEY upload REMOTE_PATH_OR_ID LOCAL_PATH
```

For example, to upload the local folder "test" to the remote "demo_folder" in the "Demo Collection":
```
girder-client --api-url https://data.htmdec.org/api/v1 --api-key API_KEY upload "/collection/Demo Collection/demo_folder" ./test
Creating Folder from test
[####################################]  9.00/9.00  100%  file.txt
Creating Folder from test/subfolder
[####################################]  5.00/5.00  100%  file.txt
```

(manage-ingest)=
## Transferring data


When data needs to be transferred automatically or continuously, the DMS supports
several options:
* Direct transfer using the [manage-girder-client](manage-girder-client)
* Direct transfer using common protocols including SFTP, rsync, or Globus.
* Automated transfer using [OpenMSIStream](openmsistream)
