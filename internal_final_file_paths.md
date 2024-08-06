### Raw files: 
  - RNA (N=33): `/nfs/lab/projects/nPOD/raw_data/RNA`
  - ATAC (N=32): `/nfs/lab/projects/nPOD/raw_data/ATAC` 
  - Multiome (N=9): `/nfs/lab/projects/nPOD/raw_data/Multiome`
### Cellranger:
  - RNA: `/nfs/lab/projects/nPOD/cellranger_output/RNA`
  - ATAC: `/nfs/lab/projects/nPOD/cellranger_output/ATAC`
  - Multiome `/nfs/lab/projects/nPOD/cellranger_output/Multiome`
### QC outputs:
  -  Original windows matrices (both snATAC and Multiome ATAC): `/nfs/lab/elisha/nPOD_output/atac/hg38/minread_1k` 
  -  Remove multiplet files (snATAC only): `/nfs/lab/elisha/nPOD_output/atac/hg38/multiplet`
  -  snATAC individual sample QC -- good barcodes: `/nfs/lab/elisha/nPOD_output/atac/hg38/clustering/individual_filter`
  -  Amulet removed barcodes:
     - snATAC: `/nfs/lab/rlmelton/npod/amulet/atac/final_barcodes/`
     - multiome: `/nfs/lab/rlmelton/npod/amulet/multiome/final_removal_bcList/`
  - SoupX and DoubletFinder files:
    - singome and multiome: `/nfs/lab/projects/nPOD/clustering_files/RNA/individual_sampleRDS`
### Clustering:
  -   Initial Objects:
      -   RNA:
      -   ATAC: `/nfs/lab/projects/nPOD/clustering_files/ATAC/1feb22_nPOD_atac_v2_correctBCs_initialObj.rds`
  -   Final Objects:
      -   RNA: `/nfs/lab/projects/nPOD/clustering_files/RNA`
      -   ATAC: `/nfs/lab/projects/nPOD/clustering_files/ATAC`
  -   List of all barcodes removed:
### Post Clustering Files:
  - RNA: 
    - DESeq results: `/nfs/lab/projects/nPOD/downstream_files/RNA/analysis/DESEQ_outputs/final`
    - fGSEA results: `/nfs/lab/projects/nPOD/downstream_files/GRN/final_results/final_table/{celltype}{disease state}_res_df.csv`
  - ATAC:
    - DESeq results: `/nfs/lab/projects/nPOD/downstream_files/ATAC/DESeq_snATAC/20230605_deseqResults_filtered2samples_count5_nPODIds/`
    - DESeq results using peaks in TF modules (used to test for TF modules enriched in T1D when considering differences in peak accessibility of peaks in TF modules): `/nfs/lab/projects/nPOD/downstream_files/ATAC/DESeq_snATAC/060732_nPOD_Ids_TFmodulePeaks/`
    - fGSEA results TF-module to peaks (input: TF as ‘pathway’ and peaks associated as ‘gene’ ) : `/nfs/lab/projects/nPOD/downstream_files/ATAC/DESeq_snATAC/060732_nPOD_Ids_TFmodulePeaks/{celltype}_atac_fGSEA_TFmodules/`
    - fGSEA results pathways to peaks (input: pathway and all peaks associated with genes in pathway ) : `/nfs/lab/projects/nPOD/downstream_files/ATAC/DESeq_snATAC/060732_nPOD_Ids_TFmodulePeaks/{celltype}_atac_fGSEA_path2peak/`
    - fisher’s exact results (connecting TF-modules to pathways): `/nfs/lab/projects/nPOD/downstream_files/GRN/final_results/final_table/{celltype}{disease state}_TFModules_DrivingPathways_FinalResults_omitNA_noFDRfilt.txt`
    - fisher's exact results (link all TFs to all pathways): `/nfs/lab/rlmelton/npod/notebooks/sherlock/Downstream_analysis_nPOD_april2022/Publication/GRN/CleanUpNotebooks/Fishers_allPaths_allTFs`
    - Chromvar: see Weston’s message above
- GRN:
    - GRN dataframes: `/nfs/lab/projects/nPOD/downstream_files/GRN/{celltype}/{celltype}_GRN_filt_GoodTFs.txt`
