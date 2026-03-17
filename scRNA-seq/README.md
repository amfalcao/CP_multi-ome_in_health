# Folder Organization 

Here you can find the files with the analysis we performed for our scRNA-seq data. The files which have the word **Postnatal** on it are teh ones containing the general analysis for all the cells on our data, being thhe **part 1** the pre-processing and cell anotation. The **part 2** contains the removal of doublets found during the process of subclustering and final plots.

**CCC_inference_Liana.Rmd:** This file contains Cell-Cell Communication inference for our scRNA-seq data using the package Liana. 

**Convert_data.R:** This file contains teh code used to convert an anndata object to ao seurat object in order to use Liana.

**DE_analysis:** This folder contains the files used to perform Differetial Expression analysis on our data. There you can find two files, one used to find the DE genes (*DE_Postnatal_Downsampling.ipynb*) and teh other one used to plot the DE genes that were selected (*DE_ploting.ipynb*). 

**Subclustering:** This folder contains teh files used to perform the analysis for ach major cell type we found. Each fil represents a different cell type according to its name.
