# singlome ATAC data

## Notebooks
- Individual samples were processed initially with scanpy using `01_snATAC_indSample_processing.ipynb` which returned a list of 'good' barcodes stored which were then used as input for Amulet 

- Amulet is a 3 part process, first we modify the singlecell.csv file produced by cellranger. This is done in `02_AMULET_singlecellFile_singlomeOnly.ipynb`. Then we run amulet in terminal (example code below). After amulet is ran, we create a merge list of barcodes to remove from our data shown in `03_mergeATACobj.ipynb`
```bash
for SAMPLE in MM_341 MM_342 MM_343 MM_344 MM_345 MM_547; do mkdir ${SAMPLE} | 
      /nfs/lab/katha/multiomics/amulet_zip/AMULET.sh --forcesorted --bambc CB --bcidx 0 --cellidx 8 --iscellidx 9 \
      /nfs/lab/elisha/nPOD_output/atac/hg38/cellranger/${SAMPLE}/outs/possorted_bam.bam \
      /nfs/lab/elisha/nPOD_output/atac/hg38/cellranger/${SAMPLE}/outs/singlecell.csv \
      /nfs/lab/katha/multiomics/AMULET/human_autosomes.txt \
      /nfs/lab/katha/multiomics/AMULET/RepeatFilterFiles/blacklist_repeats_segdups_rmsk_hg38.bed \
      /nfs/lab/rlmelton/npod/amulet/atac/${SAMPLE} \
      /nfs/lab/katha/multiomics/amulet_zip/ ; done 
```
