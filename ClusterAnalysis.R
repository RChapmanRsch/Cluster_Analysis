#cluster analysis script
corr=as.matrix(read.csv("HomeCog_PerfOCorrTable_12-14.csv",row.names = 1))
lowertricorr=corr[lower.tri(corr)]

#elementary linkage analysis : mcquitty: hierarchial syndrome method <- an improvement





Cluster=function(lowertricorr){
  d=lowertricorr
  
  tree_depth=function(list){max(sapply(names(unlist(list)), function(x){length(strsplit(x, "\\.")[[1]])}))}
  
  
  
  diag(corr)=NA
  
  #highest absolute maginute row-wise
  #which variable correlates with every variable - if multiple, mark both
  max_r=data.frame(t(sapply(colnames(corr), USE.NAMES = TRUE, function(col){
    c("rowname"=rownames(corr)[which.max(abs(corr[,col]))],
      "magn_r"=corr[which.max(abs(corr[,col])),col])
    })))
  
  
  max_r$magn_r=as.numeric(max_r$magn_r)
  
  while(length(max_r)>=1){
    #max_r[which.max(abs(max_r[,"magn_r"])),"magn_r"]
    if(length(max_r)==ncol(corr)){
      first=max_r[which.max(abs(max_r[,"magn_r"])),"rowname"]
      second=rownames(max_r)[which.max(abs(max_r[,"magn_r"]))]
      max_r=max_r[!rownames(max_r) %in% c(first,second),]
    }
    
    #change to a for loop?
    lappy(list(first, second), function(initvar){
      
      
      out=sapply(initvar, list)
      level=2

      while(tree_depth(out)<level){ #change from depth of tree to length of var>0
      
        varlist=names(out)
        
        vars=rownames(max_r)[which(max_r[,"rowname"] %in% varlist)] 
        
        out[initvar]=list(sapply(vars, list))
      
        max_r=max_r[!rownames(max_r) %in% c(vars),]

              
        vars[]
      
        
        #figure out depth of list
        level=

      
      }
      
      
      
      
    })
    
    
    col=max_r[which.max(abs(max_r[,"magn_r"])),"rowname"]
    
    corr[,col]
    
    
    
    
  }
  
  
  #Identify first cluster - first process
  
  go to the next highest magnitude - 
    
    as you add variables to cluster, don't re-add
    
    linkage between variables
    
    
    strength of the cluster -> average correlation inside the cluster vs not in the cluster
    
    
  organize to trees to describe form - double for the first two in cluster, then rest into 
  
  
  
  
  

  
  return()
}