library(fs)
library(stringr)

getwd()

# snRNA-seq & snATAC-seq
from_rna <- list.files("Data_proccessing/GSE273597_RAW/", pattern = "h5$", full.names = T, recursive = T)
from_atac <- list.files("Data_proccessing/GSE273598_RAW/", pattern = "h5$", full.names = T, recursive = T)
from <- c(from_rna, from_atac)
	
to <- str_replace(from, ".+(?=MM)", "Data_proccessing/cellranger_outputs/") %>% 
	str_replace("_raw", "/outs/raw")

dir_create(path_dir(to))
# file_copy(from, to)
file_move(from, to)


# Multiome
from <- list.files("Data_proccessing/GSE273594_RAW/", pattern = "h5$", full.names = T, recursive = T)
	
to <- str_replace(from, ".+?(?=MM)", "Data_proccessing/cellranger_outputs/") %>% 
	str_replace("_MM_\\d{3}_raw", "/outs/raw") %>%
	str_replace("MM_510", "6229_sort")


dir_create(path_dir(to))
# file_copy(from, to)
file_move(from, to)
