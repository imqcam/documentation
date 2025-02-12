(dataflows)=
# Dataflows

```{note}
This feature is still under development and has not been deployed to the
production DMS system.
```

Dataflows provide a way to automate data processing pipelines in the DMS using
the opensource [OpenMSIStream](https://github.com/openmsi/openmsistream) stream
processing and [Dagster](https://docs.dagster.io/getting-started) workflow
systems. Dataflows are implemented via container images.

The DMS currently supports two different types of dataflows:
* **OpenMSI**: Use the `GirderUploadStreamProcessor` to read data from a specified Kafka topic and write to a folder in Girder.
* **Dagster**: Read data from a configured source folder in Girder and write to a destination folder.

## Plugin

Dataflows are implemented via the [girder-dataflows](https://github.com/Xarthisius/girder-dataflows) plugin.

## Inputs and Outputs

Dataflows generally have either inputs or outputs, which are currently
supported as Girder folders.  In the following example, `Raw Data`
(input/source) and `Derived Data` (output/destination) folders have been
created.

```{figure} images/dataflows/dataflow-folders.png
---
name: dms-dataflow-folders
---
```

## Creating Dataflows

Dataflows are managed via the Dataflow panel in Girder. To create a new
Dataflow, select the **Create Dataflow** button:
 
```{figure} images/dataflows/dataflow-panel.png
---
name: dms-dataflow-panel
---
```

Dataflows have the following attributes:
* **Name**: Used for display and notifications
* **Description**
* **Dataflow type**: Either OpenMSI or Dagster
* **Source folder**: Input folder for Dagster dataflows
* **Destination folder**: Output folder for OpenMIS or Dagster dataflows
* **Topic name**: Kafka topic name for OpenMSI dataflows
* **Image**: Container image implementing the dataflow

The following is an example of an OpenMSI dataflow named `ingest` that reads
data from the `htmdec_demo` Kafka topic and writes it to the `Raw Data` folder
in Girder. This is done using the OpenMSI `GirderUploadStreamProcessor`.

```{figure} images/dataflows/dataflow-openmsi.png
---
name: dms-dataflow-openmsi
---
```

The following is an example of a Dagster dataflow named `derived-data` that
monitors the `Raw Data` folder and executes a Dagster workflow defined by the
container image, writing results--in this case plots--to the Derived Data
folder.

```{figure} images/dataflows/dataflow-dagster.png
---
name: dms-dataflow-dagster
---
```

## Running a Dataflow

To start a dataflow, select the **Run** button.

```{figure} images/dataflows/dataflow-run.png
---
name: dms-dataflow-run
---
```

Once started, details of the dataflow can be accessed via the Dagster
interface. The following figure illustrates the two running dataflows created
above.

```{figure} images/dataflows/dataflow-graph.png
---
name: dms-dataflow-graph
---
```

Outputs are written to the `Derived Data` folder in the DMS:

```{figure} images/dataflows/dataflow-output.png
---
name: dms-dataflow-output
---
```

Dataflow provenance is recorded in both Dagster and the DMS. For example, the
following figure shows the dataflow metadata in Dagster with references to
associated items in the DMS: 

```{figure} images/dataflows/dataflow-details.png
---
name: dms-dataflow-details
---
```
