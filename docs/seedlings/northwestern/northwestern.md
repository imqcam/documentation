(seedling-northwestern)=
#  Purdue/Northwestern Seedling Profile

[Machine Learning Enhanced Models for Materials@Extreme Conditions: Hypersonics and Protection](https://arl.devcom.army.mil/wp-content/uploads/sites/3/2022/09/Strachan-HTMDEC.pdf) 

```{note}
This profile is still under development.
```

The Northwestern team is responsible for process and fabrication modeling
(Thrust 1), in collaboration with Purdue.  This effort currently consists of (1)
alloy design, (2) fabrication, (3) characterization, (4) solidification
simulation, (5) microstructure simulation, and (6) validation.

* **Alloy design**:  Four-component high-entropy alloys. CALPHAD (ThermoCalc) and T-SNE are used to reduce the design space (~100,000 alloys) and select a characteristic composition. A custom script is used to loop over the parameter space, run CALPHAD simulations, extract outputs, and reformat for use with Fluent (piecewise linear density data in .scm format).
* **Fabrication**: arc melting.
* **Characterization**: SEM/EBSD is used to obtain grain orientation and boundary. EBSD data is analyzed using the MTEX open-source library to filter imperfections. EBSD sample points are selected and used to calibrate both the CDF and CA simulations.
* **Solidification simulation**: Thermal fluid simulations (CFD) using Ansys Fluent to predict temperature, liquid fraction, and temperature gradient. Points in the domain are selected for comparison to experiments. (5 points per simulation, only three can be inspected experimentally). Points are selected based on agreement with the Purdue team. Temperature gradients and solidification rates are used by the CA model. Simulations take 20-30 minutes with parameters set mainly with material properties. Also referred to as arc melting simulation.
* **Microstructure simulation**: cellular-automata (CA) to predict grain and model actual solidification. Parallelized simulations and Paraview for visualization. Each grain has its own position. Parameters need to be fit based on material, location, experiment (TODO: need to clarify what experimental data looks like). CA for each of the 5 points takes ~5-10 minutes, but may take longer. Plot of thermal gradient v. solidification velocity is used to determine the microstructure before simulation (microstructure is determined by conditions present during solidification).
* **Validation**: Comparison of EBSD orientation map 


The Northwestern team is responsible for solidification (CFD) and microstructure
(CA) simulations in collaboration with Purdue. The team faces several key data
management challenges that should be addressed by the DMS:

* For microstructure prediction, they are producing a large number of CA simulations that could be reused. They currently do not have a way to manage the simulation runs in a way that can be accessed and reused. They envision using the CA simulation dataset to apply ML methods.
* With hundreds of simulations, they would benefit from improved metadata. Currently, they primarily use a file naming convention based on concatenation of simulation parameters. Recommendations will require visibility into their current approach.
* Data sharing between Purdue and Northwestern occurs primarily via emailed files or Box. While currently small and low volume, they would likely benefit from using the HTMDEC DMS to share and track relationships between shared files.
* For transparency purposes, it would likely be beneficial to track additional information about computational workflows. These have not been discussed, but possibly: scripts used to produce and analyze CALPHAD data; raw EBSD images MTEX analysis scripts and outputs; CDF and CA workflows and provenance; metadata to connect alloy and characterization data to simulations and results.
* The HTMDEC DMS can be used to address the requirement to provide a complete copy of all data at the end of the project.


## Data:
* CALPHAD database: text-based database of coefficients, polynomial fits, density, specific heats, scalar quantities. The ThermoCalc data is SEM/EBSD data (.ANG format, relatively open)
* Points in the domain selected for comparison.
* Temperature gradients and solidification rates: Structured voxelated grid of 3D sample at mm scale. Typical domain is 1 x 0.5mm; voxel size is 5 micron.  Fluent native format/unstructured mesh).
* CA simulation dataset: Dataset of simulations for large HEA composition space can be used to train ML approach. CA animation is also an artifact.

From the Fluent solidification simulation, the history of temperature,
temperature gradient, and velocity for five points in the domain are output in a
text file format. These are used to calculate thermal inputs into the CA model. 

* EBSD (.ang) and CALPHAD files
* Fluent initial conditions (Case .cas and Data .dat files) that include the mesh, model setup and configuration, and solution parameters.
* CFG outputs (~100Kb each)
* Visualizations (PNG and PPTX)
* CA outputs
  * Orientation (TXT, ~30MB) and grain size statistics (TXT, ~100MB) 
  * VTK files used to plot 3D rendering of grain structure in Paraview. One file contains final microstructure (~30MB)  and several for intermediate timesteps (~3MB), 


## Data challenges:
* Manage a large number of CA runs in such a way that they can be reused.
* Metadata about simulations -- they have hundreds of simulations and use a filename convention based on concatenating parameters. 
* Use the CA data set to train an ML model. The current methods used to set parameters make lots of assumptions--ML approach might prove better.
* Data sharing: mainly emailed files/Box


## Software

* Computational fluid dynamics (CFD) cellular automata (CA) simulations are run using [Ansys Fluent](https://www.ansys.com/products/fluids/ansys-fluent) 22.2.0 via [Pyfluent](https://fluent.docs.pyansys.com/version/stable/) 0.12.3
* Run configurations are managed via Jupyter Notebooks
* Fluent GUI is used for interactive prototyping. Once complete, .cas and .dat files are output
* cafeSolver (proprietary software developed at Northwestern)
* MATLAB for analysis and visualization

## Data Management
* Files are generally exchanged via email
* Files are stored locally on a lab computer
* Source control management is not used

## Other notes:
* So far they have shared 3 alloys worth of data; 9 EBSD files and as many simulation results via email or Box.
* Doing experiments is the majority of the work. 
* The molecular dynamics (MD) to CA connection is planned but hasn't happened. MD uses LAMMPS (Strachan)
* They track the relationship between alloy and simulation data.
* There is an open question about how microstructure predictions can be used in FE crystal structure analysis

## Example Data

[Example data](https://data.htmdec.org/#collection/642459f84236ff9b0883e925) has
been provided for a LAMMPS-based MD simulation study of strain rates in
high-entropy alloys.

See also:
* Chunyu Li (2013). [Molecular dynamics simulations on cyclic deformation of an epoxy
 thermoset](https://docs.lib.purdue.edu/cgi/viewcontent.cgi?referer=&httpsredir=1&article=2333&context=nanopub)
