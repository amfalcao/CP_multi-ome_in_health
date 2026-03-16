QC_multiome <- function(proj_name, annotation_f) {
  print(proj_name)
  #read the data matrix
  counts_path <- paste(proj_name, "/filtered_feature_bc_matrix.h5", sep="")
  print(counts_path)
  frags_path <- paste(proj_name, "/atac_fragments.tsv.gz", sep="")
  print(frags_path)
  counts <- Read10X_h5(counts_path)
  frags <- frags_path
  
  #create seurat object with RNA and ATAC
  data_obj <- CreateSeuratObject(counts=counts$`Gene Expression`, assay='RNA', project=proj_name, annotation=annotation_f)
  data_obj[['ATAC']] <- CreateChromatinAssay(counts=counts$Peaks, sep=c(':','-'), fragments=frags, annotation=annotation_f)
  
  #add metadata
  age <- substring(proj_name,first = 1,last = 3)
  print(age)
  data_obj@meta.data['Age'] <- age
  
  DefaultAssay(data_obj) <- 'RNA'
  
  #Creating a list with all the mitochondrial genes present in the data to then caculate the metrics related to these genes.
  
  mito_genes <- c()
  for(gene in Features(data_obj)){
    
    if(grepl('^mt', gene)){
      mito_genes <- c(mito_genes, gene)
    }
  }
  
  #Creating a list with all the hemoglobin gene present in the data to then caculate the metrics related to these genes.
  
  hb_genes <- c()
  for(gene in Features(data_obj)){
    
    if(grepl('^Hb[^(p)]', gene)){
      hb_genes <- c(hb_genes, gene)
    }
  }
  
  data_obj[['pct_mito']] <- PercentageFeatureSet(data_obj, features=mito_genes)
  data_obj[['pct_hb']] <- PercentageFeatureSet(data_obj, features=hb_genes)
  
  ## ATAC
  
  DefaultAssay(data_obj) <- 'ATAC'
  
  # Calculate the strength of the nucleosome signal per cell.
  # Computes the ratio of fragments between 147bp and 294bp to fragments<147bp (nucleosome-free)
  
  data_obj <- NucleosomeSignal(data_obj)
  

  #Save the data processed until now
  save_dir <- paste(proj_name, ".rds", sep="")
  paste(save_dir)
  saveRDS(data_obj, save_dir)
  
  #delete objects from this iteration from R memory in order to avoid memory overload
  rm(data_obj, counts, frags, frags_path, counts_path, save_dir)
  
}