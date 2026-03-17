# Folder Organization

Here you can find the files with the analysis we performed for our snMultiome-seq (RNA an ATAC) data. The files which have the word **Multiome** on it are the ones containing the general analysis for all the cells on our data, being the **pt 1** the pre-processing and cell anotation. The **pt 2** contains the removal of doublets found during the process of subclustering and final plots.

**Prepare_files_and_seurat_objects.ipynb:** This file contains the preparation of additional files needed for AMULET, and prepares the data to be used as a seurat object for the analysis.

**Subclustering:** This folder contains teh files used to perform the analysis for ach major cell type we found. Each fil represents a different cell type according to its name.
