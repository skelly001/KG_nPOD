library(fs)
library(stringr)

getwd()
from <- list.files("Data_proccessing", pattern = "h5$", full.names = T, recursive = T)
	
to <- str_replace(from, ".+(?=MM)", "Data_proccessing/cellranger_outputs/") %>% 
	str_replace("_raw", "/outs/raw")

dir_create(path_dir(to))
# file_copy(from, to)
file_move(from, to)


