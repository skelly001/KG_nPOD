# Processing pipeline for nPOD multi-modal project
Here you can find all the code used to generate data and downstream analysis in our manuscript using snATAC-seq, snRNA-seq, and multiome data from the network for pancreatic donors with diabetes (nPOD).

All raw data for this project are available under the Bioproject accession number: PRJNA1141467

We have created online browsers for easy accessibility: http://tools.cmdga.org:3838/npod-whole-pancreas


## Data processing

### data preprocessing

For information regarding data preprocessing refer to `data_preprocessing.md` in data processing directory. This will include information regarding running cellranger for all modalities and window based matrix creation for chromatin data.

### initial sample processing 
For information regarding initial qc filtering and merging/clustering data refer to `data_processing.md` in the data processing directory. 

## downstream analysis 
For information regarding the analysis performed for this project refer to `downstream_analysis.md` in the downstream analysis directory.
