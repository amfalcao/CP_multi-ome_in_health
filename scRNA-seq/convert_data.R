library(Seurat)
library(reticulate)
library(anndata)


data <- read_h5ad('Postnatal_noDBL_raw_annotated.h5ad')

data


data_s <- CreateSeuratObject(counts = t(as.matrix(data$X)), meta.data = data$obs,min.features = 500, min.cells = 30)


saveRDS(data_s,"Postnatal_noDBL_raw_annotated.rds")
