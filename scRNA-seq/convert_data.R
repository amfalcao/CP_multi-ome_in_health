library(Seurat)
library(reticulate)
library(anndata)


data <- read_h5ad('noDBL_Postnatal_noDBL_raw_annotated.h5ad')

data


data_s <- CreateSeuratObject(counts = t(as.matrix(data$X)), meta.data = data$obs,min.features = 500, min.cells = 30)


saveRDS(data_s,"noDBL_Postnatal_noDBL_raw_annotated.rds")
