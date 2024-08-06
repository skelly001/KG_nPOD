# Overview of GRN methods

# Steps
1. Derived fixed peak list and create associated fixed peak files 
2. Create GRNs
3. Run fGSEA on RNA data and find associated TF-modules using Fisher's exact test

# Step 1: Derived fixed peak list and create associated fixed peak files
Notebook: `01_createFixedPeaks_github.ipynb` 

Requires: 
- peak calls
- final seurat object

General steps:
- creates a fixed peak list for each cell type using peak calls
- creates a overall fixed peak list
- creates pseudobulk matrices for each cell type using
    1. overall fixed peak file
    2. cell type specific peak file

- Adds fixed peaks as a new assay in seurat object
- create atac peak info file

# Step 2: Create GRNs
Notebook: `Final_GRN_Analysis_Commented-OnlyGRN.ipynb`

Requires:
- TF_peak_gene.csv file (csv file with all peaks with their associated genes and TFs, example: `/nfs/lab/rlmelton/npod/GRN/RecapitulateData/TF_peak_gene.csv`) 
- pseudobulk_matrix_fixedPeak.txt for each cell type (txt file of merged fixed peaks x sample ID; pseudobulk counts)
- snATAC_peak.csv file (csv file of merged peak by celltype, binary 0/1 for if peak is present in that celltype)
- project metadata file
- TPM for gene expression

General Steps:
