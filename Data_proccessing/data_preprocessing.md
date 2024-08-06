Here contains all information pertaining to data processing prior to clustering for each modality

# snRNA data
### cellranger 
- Cellranger
  - Version: cellranger-6.0.1
  - Genome: refdata-gex-GRCh38-2020-A
  - example command: `cellranger count --id ${sample} --fastqs {path_to_data}/raw_data --sample ${sample} --transcriptome {path_to_genome}/refdata-gex-GRCh38-2020-A/ --include-introns --localcores 24 --disable-ui`

# snATAC data
### step 1: cellranger atac
- Cellranger ATAC
  - Versions: cellranger-atac-2.0.0
  - genome: refdata-cellranger-atac-GRCh38-1.2.0/ 
  - sample command: `cellranger-atac count --id ${sample} --fastqs {path_to_data}/raw_data/redeep —-sample ${sample} --reference {path_to_genome}/refdata-cellranger-arc-GRCh38-2020-A-2.0.0/ --localcores 24 --disable-ui`
    
### step 2: create window-based matrices and remove multiplets
- snATAC_pipeline_10X.py 
  - sample command: `for SAMPLE in $(seq 339 342); do {path_to_script)/snATAC_pipeline_10X.py -b {path_to_cellranger_output}/${sample}/outs/atac_possorted_bam.bam -o ${sample} -n ${sample} -t 24 -m 2 --minimum-reads 1000`

- clean_barcode_multiplets_1.1.py
  - `for SAMPLE in $(seq 339 345); do python2 {path_to_script}/clean_barcode_multiplets_1.1.py {path_to_cellranger_output}/MM_${SAMPLE}/outs --prefix MM_${SAMPLE}; done`

# Multiome data
### step 1: cellranger arc
- Cellranger Arc
  - Versions: cellranger-arc-2.0.0
  - Genome: refdata-cellranger-arc-GRCh38-2020-A-2.0.0
  - Sample cmd: `cellranger-arc count --id={sample} --reference={path_to_genome}/refdata-cellranger-arc-GRCh38-2020-A-2.0.0 --libraries={path_to_library_file}/{sample}_library.csv --localcores=24 --localmem=50`

### step 2: create window-based matrices 
- snATAC_pipeline_10X.py 
  - sample command: `for SAMPLE in $(seq 339 342); do {path_to_script)/snATAC_pipeline_10X.py -b {path_to_cellranger_output}/${sample}/outs/atac_possorted_bam.bam -o ${sample} -n ${sample} -t 24 -m 2 --minimum-reads 1000`
