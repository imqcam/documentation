(openmsistream)=
# Data Acquisition 

Data acquisition through streaming provides the quickest way to close the
materials design loop. More than just data transfer, streaming enables automated
metadata capture, transformation, and analysis.

OpenMSIStream is an open source package that extends the [Apache
Kafka](https://kafka.apache.org) distributed event store and stream-processing
platform. It is designed to support streaming of experimental and computational
research data and simplify the process of configuring streaming systems aligned
with common practices for instrument-centric data collection and analysis.
OpenMSIStream runs on Linux, MacOS, and Windows and connects to different
filesystems and data stores.

% https://docs.google.com/presentation/d/1sbtmNNwMalviSazailVha-7f7AanXEbKRc3B3X0nDu4/edit#slide=id.g228361254ec_1_0
```{figure} images/openmsistream.png
---
name: openmsi-fig
---
Overview of OpenMSIStream
```

Kafka is a publish-subscribe based messaging system with four main concepts:

* Broker: Arranges transactions between producers and consumers
* Topic: User defined category or feed-name where data is stored and published
* Producer: Applications that put data into topics
* Consumer: Applications that read data from topics

OpenMSIStream implements producers and consumers specific to materials research
practices including DataFileUploadDirectory, DataFileDownloadDirectory, and
DataFileStreamProcessor.


`````{admonition} Example
:class: tip
For the laser shock PDV analysis at JHU, a `DataFileUploadDirectory` service
runs on the PDV system. Researchers copy datafiles to a specific directory and
they are streamed to a Kafka topic. A set of DataFileStreamProcessors run on the
HTMDEC platform to (1) acquire and organize the raw waveform data and (2) run
the PDV analysis software for the anlaysis of spall signals.
```
