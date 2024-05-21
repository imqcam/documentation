## Metadata Upload Forms

One function of the data portal is to collect and validate manually entered metadata for different aspects of the project, including associated file uploads. The ["schema" folder in the IMQCAM/uploaders GitHub repository](https://github.com/imqcam/uploader/tree/main/schema) holds several `json` files defining the schema for those metadata uploads.

The files programmatically define each metadata field collected for a particular aspect of the project, possibly including bounds on allowed values. The data portal renders the schema defined in the files as "Forms" that users can access to add new entries of a particular type into the data system. New entries are validated against their defined schema in real time. Users should contact members of the data handling team if a particular option needed for an upload is missing, or if validation bounds or other aspects of the schema need to be updated to allow a new upload.

From the ["Forms" tab](https://data.imqcam.org/#forms) on the data portal website, users can click on a specific Form, which will take them to a listing of all of the existing entries for that Form. New entries can be added by clicking the green "plus sign" button in the upper right corner of the page.

Completed entries are stored in the data portal, as are any files that are uploaded using the forms. Users can view and edit form entries in the data portal after they've been initially created, or access them programmatically as structured JSON objects using the Girder RESTful API.

### "Raw Powder Details" form

The [Raw Powder Details upload form](https://data.imqcam.org/#form/663e6d21b18fa1c426e939ab) is used to collect and validate details about raw feed powder materials including their compositions and basic properties. Users can also upload documents from manufacturers with further information about a particular batch of powder.

Some details about specific fields are:
- **Raw Powder ID:** This field must be unique for each entry. It should be recognizable, and probably include the name of the manufacturer, the powder material, and some identifier like the batch number from the manufacturer.
- **Additional Batch Information:** These "miscellaneous" entries are simple key/value pairs for storing unvalidated details of a batch of powder. You can add anything you'd like, such as the batch number, the total weight of the batch, or a "comments" field, but know that entries here are not validated or particularly well structured.
- **Powder Composition:** Each element present in the powder should be listed. The "Balance?" box should be checked for at most one element representing the remaining balance of the composition.

Files uploaded along with the metadata entered in this form will be saved in the "Forms" Collection in the data portal, in the ["Raw Powder Details" folder](https://data.imqcam.org/#collection/663e6dbdb18fa1c426e939ad/folder/663e6e1ab18fa1c426e939ae).
