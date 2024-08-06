This document contains all information regarding initial individual sample QC filtering and merging/clustering each modality
# Initial filtering
## snRNA
- Notebook: `notebooks/RNA_notebooks/01_indSample_processing_singlome.ipynb`
- General process:
  - read in raw h5 matrix from cellranger output
  - filter barcodes by a minimum number of genes filter 
  - run DoubletFinder to detect doublets -- we used an estimated 4% doublet rate
  - run SoupX to remove ambient contamination -- we used the gene based method using marker genes for acinar cells 
  - save RDS
  
## snATAC
- Notebooks:
  - Initial sample filtering -- scanPy  `notebooks/ATAC_notebooks/01_snATAC_indSample_processing.ipynb`
  - Amulet:
    - Step 1: Modify cellranger singlecell.csv file to keep all post QC barcodes
      - notebook: `notebooks/ATAC_notebooks/02_AMULET_singlecellFile_singlomeOnly.ipynb`
    - Step 1: Run Amulet in terminal 
      - sample cmd: `for SAMPLE in MM_341 MM_342 MM_343 MM_344 MM_345 MM_547; do mkdir ${SAMPLE} | 
      {path_to_amulet}/AMULET.sh --forcesorted --bambc CB --bcidx 0 --cellidx 8 --iscellidx 9 \
      {path_to_cellranger}/${SAMPLE}/outs/possorted_bam.bam \
      {path_to_singlecellFile}/singlecell.csv \
      /nfs/lab/katha/multiomics/AMULET/human_autosomes.txt \
      /nfs/lab/katha/multiomics/AMULET/RepeatFilterFiles/blacklist_repeats_segdups_rmsk_hg38.bed \
      /nfs/lab/rlmelton/npod/amulet/atac/${SAMPLE} \
      /nfs/lab/katha/multiomics/amulet_zip/ ; done `
    - Step 3: Modify output to include sample IDs, used to remove from merged seurat object
      - notebook: `notebooks/ATAC_notebooks/03_mergeATACobj.ipynb`
## Multiome
  - rna component: part of the individual sample processing pipeline notebook above
  - atac component: processed within the atac pipeline described above

    
# Merging and clustering data
## snRNA
  - clustering:`notebooks/RNA_notebooks/02_mergeSamples_clusterRNA.ipynb`
## snATAC
  - clustering:`notebooks/ATAC_notebooks/03_mergeATACobj.ipynb`
  - Peak calling [github repo](https://github.com/Gaulton-Lab/peak-call-pipeline)
  - Manual doublet removal and repeat clustering performed in [ADD NOTEBOOK]
  - label transfer: `/nfs/lab/rlmelton/npod/notebooks/sherlock/snATAC_pipelineNotebooks/04_labelTransfer_template.ipynb`
