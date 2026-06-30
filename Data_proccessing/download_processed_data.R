options(timeout = 7200) 
dest <- getwd()

download.file("https://npod-data-download.s3.us-west-2.amazonaws.com/072424_npod_RNA.rds",
              file.path(dest, "072424_npod_RNA.rds"),  mode = "wb")   # mode="wb" is required on Windows
download.file("https://npod-data-download.s3.us-west-2.amazonaws.com/120125_npod_ATAC.rds",
              file.path(dest, "120125_npod_ATAC.rds"), mode = "wb")


library(Seurat); library(Signac)
rna  <- readRDS("C:/Users/Shane/dev/KG_nPOD/072424_npod_RNA.rds")
atac <- readRDS("C:/Users/Shane/dev/KG_nPOD/120125_npod_ATAC.rds")
rna        # inspect: assays, cell count, metadata
atac